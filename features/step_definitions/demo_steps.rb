Given /^demo mode is active$/ do
  And   %{I am signed out}
  Given %{I am a new, authenticated user}
  And   %{I am signed out}
end
