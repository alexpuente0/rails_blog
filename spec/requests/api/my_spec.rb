require 'swagger_helper'

RSpec.describe 'api/Alex_blog', type: :request do
  path '/posts' do
    post 'Creates a post' do
      tags 'Post'
      consumes 'application/json'
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          text: { type: :text }
        },
        required: [ 'title', 'text' ]
      }

      response '201', 'post created' do
        let(:post) { { title: 'foo', text: 'bar' } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:post) { { title: 'foo' } }
        run_test!
      end
    end
  end

  # path '/blogs/{id}' do

  #   get 'Retrieves a blog' do
  #     tags 'Blogs', 'Another Tag'
  #     produces 'application/json', 'application/xml'
  #     parameter name: :id, in: :path, type: :string

  #     response '200', 'blog found' do
  #       schema type: :object,
  #         properties: {
  #           id: { type: :integer },
  #           title: { type: :string },
  #           content: { type: :string }
  #         },
  #         required: [ 'id', 'title', 'content' ]

  #       let(:id) { Blog.create(title: 'foo', content: 'bar').id }
  #       run_test!
  #     end

  #     response '404', 'blog not found' do
  #       let(:id) { 'invalid' }
  #       run_test!
  #     end

  #     response '406', 'unsupported accept header' do
  #       let(:'Accept') { 'application/foo' }
  #       run_test!
  #     end
  #   end
  # end
end
