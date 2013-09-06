user = User.where("id <> -1 and username_lower = 'system'").first
if user
  user.username = UserNameSuggester.suggest("system")
  user.save
end

User.seed do |u|
  u.id = -1
  u.name = "system"
  u.username = "system"
  u.username_lower = "system"
  u.email = "no_email"
  u.password = SecureRandom.hex
  # TODO localize this, its going to require a series of hacks
  u.bio_raw = "Not a real person. A global user for system notifications and other system tasks."
  u.active = true
  u.admin = true
  u.moderator = true
  u.email_direct = false
  u.approved = true
  u.email_private_messages = false
end
