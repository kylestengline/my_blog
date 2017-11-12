# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Life.destroy_all
Code.destroy_all

unless User.find_by(email: ENV['BLOG_EMAIL'])
  User.destroy_all
  User.create!(
    email: ENV['BLOG_EMAIL'],
    password: ENV['BLOG_PASSWORD'],
    id: 1
  )
end

Life.create!([
  {
    title: "Hangin Out",
    content: "A little over a year ago, I met someone that I liked; a crush, if you will. I suddenly had the urge to write something and wanted to relay the message to her. After consulting some friends, we thought it best I didn't. It wasn't as if I had anything to lose if I did send her the message. I'm certain she didn't feel the same about me, and I don't know that she knew the way I felt about her. Maybe the gesture would have been nice? Or it would have made her feel awkward, in which case, I wouldn't like the thought of impeding on her happiness. No matter the scenario; as it is now in the past, I'll leave this here for the world. 
> You know as I was walkin, just thinkin, you and I are just people. You're a person, I'm a person, just livin, walkin and talkin and bein about ourselves. The thoughts that did occur, so solemnly in my mind, was that us people; you a person, me a person, could be chillin, just relaxin, hangin with other persons, maybe two or three, cause they be people too. Maybe we all be people; just chillin, doin what we doin as people do sometimes. So as my thoughts did conclude, in an oh so matter o' fact way, is that we could all be people, just hangin, bein about what we be about and doin what we do best...just hangin out.",
    user_id: 1
  },
  {
    title: "Sea Of Heart",
    content: "For as long as I can remember, I've loved the sea. I love everything about it; the mystery, the vastness, the things we don't even know are there. It mostly impresses me because there is nothing else like it and nothing nearly as powerful as the sea. Thus, I've written about how I feel:
> Of all my days that were, I look back into my past and see what was and all that will never be. Left things behind to remember me and preserve our days of yore. For eternity doesn't seem so long when I'm with you. So pull the lever, hoist the sail and swing downwind, for my heart you carry and I long for your embrace. Hold steady the tide, and the seas be calm; for the stern faces west where the sun sets before your eyes. Let all the stars guide me and the moon that shares our eyes: my compass in the night. May the masts hold strong and no storm shall best me or navigation fail; for I follow the winds that sound your name and bring me home to you.",
    user_id: 1
  },
  {
    title: "A Glimpse Of Me",
    content: "A few years ago, when I was traveling about the country, I wrote this as sort of a memoir. I was traveling through the desert between two small towns in the middle of Arizona; around a small town known as Prescott. The desert is so vast and yet full of life and I very much enjoyed traveling through nothing, but at the same time everything. And so, that is what gave birth to this poem.
> The night offers me a cool breeze while the moonlight spotlights the winding trees. The scene serenades my mind to ease. I've always enjoyed the pleasures of the night. The fainting lights and neon glows highlight my every imperfection, while, in all of one moment, silhouettes passerby's and anyone within the bounds of my periphery. Not in the desert though. Light hardly yields a shadow, unless the moon is out. It's beauty just the same as any cityscape, from a photographers point of view. It's quaint landscapes grown dry with small trees and cacti sparsely placed. Back at the hotel, I'm welcomed by silence most late nights exhibit; unbroken by train, motorbike or car. Nothing pierces the sound of silence, and in the middle of all its brilliance stands a troubadours silhouette, the figure of which, resembling my own.",
    user_id: 1
  },
  {
    title: "The Letter",
    content: "I saw a movie a few years ago that really helped shape the way I pursue my goals. The person this letter is to isn't the most inspirational person in my life, but I do have to give credit to them in helping me get my feet off the ground and pursuing my, then, goals. And so, the letter. 
> Alas! In the sum of this world I've come down to one of a few treasures. One of which stands before me underneath the infinite light. To sum up the words spent in this note; I want to thank you for being you. To elicit the emotions running through my mind, I thought it best to write them. Mostly, it's the fault of time that shortens our encounter, but in the same notion it has also brought us here. So, you stand before me, the accolade of my life. And just as simply, no words could find me. Thus you receive a letter. Though my speech has been deterred, the blank pages of this world found such verbiage, thus I present them to you:
    
>    Inspiration wove a tapestry into such magnificence, I found myself enveloped by it. You've undoubtedly added to its splendid color. I see in your eyes the threads that make it whole. The completeness of which could not have been manufactured without you. And so an unaccustomed tapestry hangs ornamentally magnificent; bearing the strength that time will never wear. Once more, thank you for being you. 
    
>    Kyle ",
    user_id: 1
  }
])

Code.create!(
  title: "Advanced Search",
  content: "I built a web based app that emulates [petfinder.com](https://www.petfinder.com/). The inspiration around this was that I knew I wanted to build something, but wasn't sure what to build. I figured, I like dogs and Petfinder is a pretty cool site, so why not build a similar site, but just for dogs? Out came Dog Seekers. I built Dog Seekers to prove to myself that I was capable of building a large scale project with only the help of Google. In the past, I've implemented features to large projects, but never built an entire large scale project; top-to-bottom. If you're reading this, then I've accomplished exactly what I set out to do. There's still A LOT of work to do, but I've simply come to terms with the fact that I'm going to be working on this for a while. To me, no project is really *finished*, because there's always work to be done. 
  I learned a ton about the work it takes to build a larger scale web app, including search forms; which I'm particularly proud of. For the search form, I didn't use any gems. I built the search form from hours of googling, thinking I had a solution (but really didn't), and finally arriving at a [tutorial by Justin Weiss](http://www.justinweiss.com/articles/search-and-filter-rails-models-without-bloating-your-controller/) about advanced search forms. The tutorial greatly helped me understand how search forms actually work. After arriving at the tutorial, I learned a great deal more about modules, models, scope, and so, so much more.
For the search form, I had to do the following:
- The first thing we need to do is go into `app/models/concerns/`. Here I created a `search_filter.rb` file and created two modules.

```ruby
module SearchFilter
  extend ActiveSupport::Concern

  module ClassMethods
    def search_filter(filter_params)
      results = self.where(nil)
      filter_params.each do |key, value|
      results = results.public_send(key, value) if value.present?
    end
    results
  end
end
```
- With these modules, I can now include them in the model where I need to implement the search functionality. In my case, I went to my `app/models/application_record.rb` and added `include SearchFilter`. After which, I added the following code to my `app/models/dog.rb`. This allows me to search with scopes, which is exactly what I needed. I wanted to be able to filter the search so the user can search for specific, individual attributes of a dog. With the below code, the user can now search by `location` or `breed` or `title_age` or `gender` individually as well as all of the above.

```ruby
scope :location, -> (location) { where location: location }
scope :breed, -> (breed) { where breed: breed }
scope :title_age, -> (title_age) { where title_age: title_age }
scope :gender, -> (gender) { where gender: gender }
```
- With my model setup and the module in place, I can now go to my `app/controllers/searchs_controller.rb` and implement my search filter. **Remember** to add the scopes by which you want to search.

```ruby
class SearchsController < ApplicationController
  
  def index
    @dogs = Dog.search_filter(params.slice(:location, :breed, :title_age, :gender))
  end

end
```
- And of course, my `app/views/shared/_header.html.erb` where I have my search form.

```html
<ul class='dog-search'>
  <div class='search-for-dogs-form'>
    <%= form_tag searchs_index_path, method: 'get', class: 'search-dogs' do %>
      <div id='form-searching-for-dogs'>
        <div class='location'>
          <% label_tag :location, class: 'location-label' %>
          <%= number_field_tag :location, params[:location], max: 0..5, placeholder: 'Zip Code', class: 'zip-code-area', required: true %>
        </div>

        <div class='dog-breed'>
          <% label_tag :breed, class: 'breed-label' %>
          <%= text_field_tag :breed, params[:breed], placeholder: 'Breed', class: 'breed-text-field' %>
        </div>

        <div class='search-dog-age'>
          <p class='age-name'>Choose an Age:</p>
          <%= radio_button_tag :title_age, 'baby', id: 'age-baby' %>
          <%= label_tag :title_age_baby, 'Baby: 0-2 years', class: 'age-baby' %>
          <br/>
          <%= radio_button_tag :title_age, 'young', id: 'age-young' %>
          <%= label_tag :title_age_young, 'Young: 3-5 years', class: 'age-young' %>
          <br/>
          <%= radio_button_tag :title_age, 'adult', id: 'age-adult' %>
          <%= label_tag :title_age_adult, 'Adult: 6-8 years', class: 'age-adult' %>
        </div>

        <div class='dog-gender'>
          <% label_tag :gender, class: 'gender-label' %>
          <%= text_field_tag :gender, params[:gender], placeholder: 'Dog Gender', class: 'gender-text-field' %>
        </div>

        <div class='submit-button-for-search'>
          <%= submit_tag 'Search for Dogs', name: nil, class: 'dog-search-submit-button' %>
        </div>
      </div>
    <% end %>
  </div>
</ul>
```
- That's it! I can now search with scopes.",
user_id: 1
)

puts "Life posts created: #{Life.count}"
puts "Code posts created: #{Code.count}"
