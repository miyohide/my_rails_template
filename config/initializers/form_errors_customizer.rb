ActionView::Base.field_error_proc = proc do |html_tag, instance|
  def invalid_feedback_msg(error_msg)
    if error_msg.respond_to?(:first) && error_msg.size > 1
      # 該当フォームにエラーメッセージが複数個ある場合
      html_list_errors = "<ul class='pl-3'></ul>"
      error_msg.each do |msg|
        html_list_errors.insert(-6, "<li>#{msg}</li>")
      end
      %{<div class='invalid-feedback'>#{html_list_errors}</div>}.html_safe
    elsif error_msg.respond_to?(:first)
      # 該当フォームのエラーメッセージが配列として格納されている場合
      %{<div class='invalid-feedback mb-1'>#{error_msg.first}</div>}.html_safe
    else
      # 該当フォームのエラーメッセージが文字列の場合
      %{<div class='invalid-feedback mb-1'>#{error_msg}</div>}.html_safe
    end
  end

  if html_tag =~ /^<label/
    # ラベルの場合
    if html_tag =~ /form-check-label/
      html_tag.html_safe + invalid_feedback_msg(instance.error_message)
    else
      html_tag.html_safe
    end
  else
    # フォームの場合、各フォームにis-invalidクラスを付与
    html_tag.gsub!("form-check-input", "form-check-input is-invalid")
    html_tag.gsub!("form-control", "form-control is-invalid")
    if html_tag =~ /form-check-input/
      html_tag.html_safe
    else
      html_tag.html_safe + invalid_feedback_msg(instance.error_message)
    end
  end
end
