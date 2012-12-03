module ResourcesHelper
  def myTruncate(myText)
      truncate(myText, :length => 160, :separator => ' ', :omission => "...")
  end

  def restrictions_note
    if @resource.restricted = true
      restrictions_note = "Restricted to current IIT students, faculty and staff."
    else
      restrictions_note = "No restrictions."
    end
  end

  def popular_note
    if @resource.popular = true
      restrictions_note = "Yes"
    else
      restrictions_note = "No"
    end
  end

end
