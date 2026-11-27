/*
 * $DOC$
 * $NAME$
 * wgWindow
 *
 * $ONELINER$
 * Create a Windows window with a WebView2 page
 *
 * $SYNTAX$
 * wgWindow():New( [cTitle], [nWidth], [nHeight] ) --> oWindow
 * oWindow:Run() --> NIL
 * oWindow:Close() --> NIL
 * oWindow:Open( cFile ) --> lSuccess
 * oWindow:Send( cJson ) --> oWindow
 * oWindow:onMessage := {| oWindow, cJson | ... }
 *
 * $ARGUMENTS$
 * `cTitle` Initial title of the window.
 * `nWidth` Width of the client area in logical pixels. The default is 640.
 * `nHeight` Height of the client area in logical pixels. The default is 480.
 * `cFile` Local HTML file. Relative paths start in the executable's directory.
 * `cJson` JSON text. In `Send()` it is decoded for JavaScript. In `onMessage` it is the serialized message from the page.
 *
 * $RETURNS$
 * `New()` returns the window and `Send()` returns the same window. `Open()` returns `.T.` when it accepts the file for navigation or `.F.` when the file cannot be found or its path cannot be converted to a file URL. `Run()` and `Close()` return `NIL`.
 *
 * $DESCRIPTION$
 * `New()` creates a hidden window. Create controls before `Run()` to show them on the built-in page. `Run()` starts WebView2, shows the window and handles events until the window closes. It raises an error if WebView2 cannot start. Call `Close()` to close the window from xDev.
 *
 * Use `Open()` for a local HTML page. A nonempty HTML title becomes the window title. JavaScript sends a value with `window.chrome.webview.postMessage(value)`. The xDev block in `onMessage` receives the window and the JSON text. String messages starting with `wg:` are reserved for the library.
 *
 * `Send()` delivers JSON to the page's `message` listener on `window.chrome.webview`. The listener reads the decoded value from `event.data`. Messages sent before the page is ready are queued. Register the JavaScript listener while the page loads to receive the initial messages. Use `window.close()` to close the window from the page.
 *
 * $NOTES$
 * `handle` is the read-only native window handle. The example writes its HTML to a temporary file. After receiving its initial greeting, the page can send a message by clicking the button.
 *
 * $CATEGORY$
 * User libraries WebGUI
 *
 * $SEEALSO$
 * WebGUI, wgControl, wgMenu, wgSidebar
 *
 * $DOCEND$
 */

PROCEDURE Main()

   LOCAL cFile
   LOCAL pFile := FileTemp( @cFile, NIL, "webgui", ".html" )
   LOCAL cHtml := '<!doctype html><meta charset="utf-8"><title>WebGUI messages</title>' + ;
      '<p id="status"></p><button id="reply">Reply</button><script>' + ;
      'const webview = window.chrome.webview;' + ;
      'webview.addEventListener("message", event => {' + ;
      '  document.getElementById("status").textContent = event.data.text;' + ;
      '});' + ;
      'document.getElementById("reply").onclick = () => webview.postMessage({reply: true});' + ;
      '</script>'
   LOCAL oWindow

   IF pFile == NIL
      RETURN
   ENDIF

   IF FileWrite( pFile, cHtml ) != Len( cHtml )
      FileClose( pFile )
      FErase( cFile )
      RETURN
   ENDIF
   FileClose( pFile )

   oWindow := wgWindow():New( "WebGUI messages", 480, 300 )
   IF oWindow:Open( cFile )
      oWindow:onMessage := {| o, cJson | o:Send( '{"text":"Reply received"}' ) }
      oWindow:Send( '{"text":"Hello from xDev"}' )
      oWindow:Run()
   ELSE
      oWindow:Close()
   ENDIF
   FErase( cFile )

RETURN
