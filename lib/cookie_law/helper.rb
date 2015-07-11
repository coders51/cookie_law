module CookieLaw::Helper
  # Iniects privacy policy banner and initializes javascript
  def cookie_law!
    render 'cookie_law/banner'
  end

  def policy_accepted?
    return false unless cookies[:cl_accepted].is_a?(String)
    begin
      JSON.parse(cookies[:cl_accepted])['accepted']
    rescue JSON::ParserError
      cookies.delete[:cl_accepted]
      false
    end
  end
end
