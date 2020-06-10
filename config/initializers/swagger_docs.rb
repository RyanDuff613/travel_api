Swagger::Docs::Config.register_apis({
  "1.0" => {
    # the extension used for the API
    :api_extension_type => :json,
    # the output location where your .json files are written to
    :api_file_path => "public/",
    # the URL base path to your API
    :base_path => "localhost//3000/reviews",
    # if you want to delete all .json files at each generation
    :clean_directory => true,
    # Ability to setup base controller for each api version. Api::V1::SomeController for example.
    :parent_controller => ReviewsController,
    # add custom attributes to api-docs
    :attributes => {
      :info => {
        "title" => "Travel Review API",
        "description" => "API for travel reviews",
      }
    }
  }
})