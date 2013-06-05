# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
#Rtdash::Application.config.secret_token = '98f444d1f484ae5618988545f098e1abaa917de46b5469e5f902a961de4e1af2fb3710fe90ddf365075e8ae3b9d911f054b985cc5882f2b58515cec7c7486e57'

if ENV["SECRET_TOKEN"].blank?
  if Rails.env.production?
    raise "You must set ENV[\"SECRET_TOKEN\"] in your app's config vars"
  elsif Rails.env.test?
    # Generate the key and test away
    ENV["SECRET_TOKEN"] = Rtdash::Application.config.secret_token = SecureRandom.hex(30)
  else
    config_file = File.expand_path(File.join(Rails.root, '/config/config.yml'))
    config = YAML.load_file(config_file)
    # Generate the key, set it for the current environment, update the yaml file and move on
    ENV["SECRET_TOKEN"] = config[Rails.env]['SECRET_TOKEN'] = SecureRandom.hex(30)
    #File.open(config_file, 'w') { |file| file.write(config.to_yaml) }
  end
end

# TODO remove secret_token rails 4 only uses key_base
Rtdash::Application.config.secret_token = ENV["SECRET_TOKEN"]
# TODO need to added secret_key_base to config.yml
Rtdash::Application.config.secret_key_base = "a8b23985eacceb4a6677ca85bc3d4af15a1426fe85b047373b32c9ade841"
