// Entry point for the build script in your package.json
// BootstrapのCSSやJavaScriptをインポートする
import 'bootstrap/dist/css/bootstrap.min.css';
// BootstrapのJavaScript側の機能を読み込む
import 'bootstrap';
import '@hotwired/turbo-rails';
import './controllers';
