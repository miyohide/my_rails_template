// Entry point for the build script in your package.json
// BootstrapのCSSやJavaScriptをインポートする
// see. https://getbootstrap.com/docs/5.0/getting-started/webpack/
import 'bootstrap/dist/css/bootstrap.min.css';
import 'bootstrap';
import '@hotwired/turbo-rails';
import './controllers';
