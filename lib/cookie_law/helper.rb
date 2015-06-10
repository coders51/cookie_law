module CookieLaw::Helper
  # Iniects privacy policy banner and initializes javascript
  def cookie_law!
    render 'cookie_law/banner'
  end
end
