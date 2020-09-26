# Run the application data recipe
include_recipe 'olyn_init::application_data'

# Run the Berkshelf recipe
include_recipe 'olyn_init::berkshelf'

# Include the secret key file recipe
include_recipe 'olyn_init::secret_key_file'
