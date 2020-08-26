require 'rails_helper'
require "rspec/json_expectations"

describe V1::QuotesController, type: :controller do

    context "http_status" do

        it 'request show and return 200' do
            controller.class.skip_before_action :authenticate
                
            get(:show, params: { search_tag: 'life' })
            expect(response).to have_http_status(200)
        end

    end

    context "crawler" do

        it 'check change' do
            get(:show, params: { search_tag: 'life' })
            expect(response).to have_http_status(200)
            expect(response.body).to include_json("quotes"=>
                [
                    {"quote"=>"“There are only two ways to live your life. One is as though nothing is a miracle. The other is as though everything is a miracle.”","author"=>"Albert Einstein","author_about"=>"http://quotes.toscrape.com/author/Albert-Einstein",
                        "tags"=>["inspirational", "life", "live", "miracle", "miracles"]
                    },
                    {"quote"=>"“It is better to be hated for what you are than to be loved for what you are not.”", "author"=>"André Gide", "author_about"=>"http://quotes.toscrape.com/author/Andre-Gide",
                        "tags"=>["life", "love"]}
                ],"meta"=>
                {
                    "current_page"=>1, "next_page"=>nil, "prev_page"=>nil, "total_pages"=>1, "total_count"=>2
                }
            )
        end
       
        it 'kind of return' do
            get(:show, params: { search_tag: 'life' })
            expect(response).to have_http_status(200)
            expect(response.body).to include_json("quotes"=>
                [
                    {"quote"=> be_kind_of(String),"author"=> be_kind_of(String) ,"author_about"=> be_kind_of(String) ,
                        "tags"=> be_kind_of( Array )
                    },
                    {"quote"=> be_kind_of(String), "author"=> be_kind_of(String), "author_about"=> be_kind_of(String),
                        "tags"=> be_kind_of(Array)
                    }
                ],"meta"=>
                {
                    "current_page"=> be_kind_of(Integer), "next_page"=> nil, "prev_page"=> nil, "total_pages"=> be_kind_of(Integer), "total_count"=> be_kind_of(Integer)
                }
            )
        end
    end
end