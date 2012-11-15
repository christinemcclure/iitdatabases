module ResourcesHelper
  def myTruncate(myText)
      truncate(myText, :length => 160, :separator => ' ', :omission => "...")
  end
end
