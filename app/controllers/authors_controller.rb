# frozen_string_literal: true

class AuthorsController < ApplicationController
  before_action :authenticate_author!

  layout 'authors'
end
