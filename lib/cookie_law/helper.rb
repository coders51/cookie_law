module CookieLaw::Helper
  # Iniects privacy policy banner and initializes javascript
  def cookie_law!
    render 'cookie_law/banner'
  end

  def policy_accepted?
    return false unless cookies[CookieLaw.cookie_name].is_a?(String)
    begin
      cookies[CookieLaw.cookie_name]['accepted']
    rescue JSON::ParserError
      cookies.delete[CookieLaw.cookie_name]
      false
    end
  end
end
