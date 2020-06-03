# エラーが起きたときにfieldにbootstrapのclassを追加する
ActionView::Base.field_error_proc = proc do |html_tag, _instance|
  # HTMLタグにclass属性があるか
  class_attr_index = html_tag.index 'class="'

  if class_attr_index
    # classの指定があればis-invalidを追加
    html_tag.insert class_attr_index + 'class="'.size, 'is-invalid '
  else
    # classの指定がなければclassを追加
    html_tag.insert html_tag.index('>'), ' class="is-invalid"'
  end
end
