# エラーが起きたときにfieldにbootstrapのstyleを追加する
ActionView::Base.field_error_proc = proc do |html_tag, instance|
  # 断片的なHTMLをparseする
  fragment = Nokogiri::HTML.fragment(html_tag)
  # input要素を選択する
  field = fragment.at('input,select,textarea')
  # エラーが発生しているモデルを取得し、エラーメッセージを組み立てる
  model = instance.object
  error_message = model.errors.full_messages.join(', ')

  html = if field
    # classにbootstrapのstyleを当てる
    field['class'] = "#{field['class']} is-invalid"
    # エラーメッセージを表現するテキストをタグの直後に追加
    html = <<-HTML
      #{fragment.to_s}
      <p class="invalid-feedback">#{error_message}</p>
    HTML
    html
  else
    html_tag
  end

  html.html_safe
end
