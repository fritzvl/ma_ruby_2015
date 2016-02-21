Lesson 14.Rails
------------------

RubyOnRails web application framework
---------------

* Rails overview
* Rails main components
* RESTful applications
      * Stateless
      * Cacheable
      * Layered system
      * Code on demand(optional)
      * Uniform interface
        1. Identification of resource
        2. Manipulation of resources through these representations
        3. Self-descriptive message
        4. Hypermedia as the engine of application state(HATEOAS)
* Rails routing
* Rails naming conventions
* Rails controllers parameters
* Rails controllers
* Controllers filters
* Rescue in controllers

* Testing routing and controllers

-------------------

### Blog Application

* Basics
  * Post as Scaffold
  * Comments from scratch
* [Devise](https://github.com/plataformatec/devise)
  * Add users and authentication
  * Set posts and comments ownership to users
* [ActiveAdmin](https://github.com/activeadmin/activeadmin)
  * Add ActiveAdmin backend and Author model
  * Set posts ownership to Author
  * Move posts management to ActiveAdmin
  * Add simple dashboard
  
-------------------

#### RoR front-end
---------------

* Layouts/Views/Partials
* Assets pipeline. Why and how?
* ERB/HAML/Slim/Liquid
* Forms/Simple forms
* SCSS
* Javascript, AJAX, Turbolinks


* Useful links
    * [Routing](http://edgeguides.rubyonrails.org/routing.html)
    * [Action Controller](http://edgeguides.rubyonrails.org/action_controller_overview.html)

-------------------

* Machine-like URL
  /weather_services/1/20150301/temperature/:lat/:long
  /weather_services/1/20150301/humidity/:lat/:long
* Human-like URL
  /weather/:lat/:long
  /weather/:lat/:long/services