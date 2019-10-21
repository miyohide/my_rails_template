module ApplicationHelper
  # 画面ごとのJavaScriptのパスを返す
  def js_path
    path = "#{controller_path}/#{action_name}.js"
    if js_file_exist?(path)
      path
    else
      "default.js"
    end
  end

  def js_file_exist?(path)
    manifest = JSON.parse(File.read("public/packs/manifest.json"))
    manifest.key?(path)
  end
end
