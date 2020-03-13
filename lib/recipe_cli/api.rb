class RecipeCli::API 
  
  def fetch(string)
    url = "https://api.edamam.com/search?q=#{string}&app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797"
    respone = HTTPParty.get(url)
    binding.pry 
  end
end
    
    


  #gets search term = https://api.edamam.com/search?q= pasta,tomato,sausage &app_id=f6f7d13e&app_key=3e087fb68f68af8ea863608aa9f7d797