JRuby Cloud Foundry Samples
==============================

This repository contains sample applications to demonstrate the use of
the JRuby runtime on Cloud Foundry
(<http://www.cloudfoundry.com/>).

You can find further sample applications at following links.

- <https://github.com/cloudfoundry/vcap-test-assets/>
- <https://github.com/SpringSource/cloudfoundry-samples>
- <https://github.com/rabbitmq/rabbitmq-cloudfoundry-samples/>

Available Samples
------------------------------

<table>
  <tr>
    <th>Runtime</th><th>Framework</th><th>Service</th><th>Status</th><th>Description</th>
  </tr>
  <tr>
    <td>JRuby 1.8 / 1.9</td><td>Sinatra(non Gemfile)</td><td>-</td><td>available</td><td></td>
  </tr>
  <tr>
    <td>JRuby 1.8 / 1.9</td><td>Sinatra(Gemfile)</td><td>-</td><td>available</td><td></td>
  </tr>
  <tr>
    <td>JRuby 1.8 / 1.9</td><td>Sinatra(Gemfile)</td><td>MongoDB</td><td>available</td><td>Use Mongoid 2.2.4</td>
  </tr>
  <tr>
    <td>JRuby 1.8 / 1.9</td><td>Sinatra(Gemfile)</td><td>Redis</td><td>available</td><td>Use redis-rb</td>
  </tr>
  <tr>
    <td>JRuby 1.8 / 1.9</td><td>Sinatra(Gemfile)</td><td>MySQL</td><td>available</td><td>Use DataMapper(with do_jdbc)</td>
  </tr>
  <tr>
    <td>JRuby 1.8 / 1.9</td><td>Sinatra(Gemfile)</td><td>PosgreSQL</td><td>available</td><td>Use ActiveRecord-JDBC, standalone-migrations</td>
  </tr>
  <tr>
    <td>JRuby 1.8 / 1.9</td><td>Sinatra(Gemfile)</td><td>RabbitMQ</td><td>available</td><td>Use Bunny</td>
  </tr>
  <tr>
    <td>JRuby 1.8 / 1.9</td><td>Sinatra(Gemfile)</td><td>Neo4j</td><td>unavailable</td><td>Use Neography(?)</td>
  </tr>
  <tr>
    <td>JRuby 1.8 / 1.9</td><td>Rails 3.0.x(use 3.0.5)</td><td>-</td><td>available[1]</td><td></td>
  </tr>
  <tr>
    <td>JRuby 1.8 / 1.9</td><td>Rails 3.0.x(use 3.0.5)</td><td>MongoDB</td><td>available</td><td>Use MongoMapper</td>
  </tr>
  <tr>
    <td>JRuby 1.8 / 1.9</td><td>Rails 3.0.x(use 3.0.5)</td><td>Redis</td><td>available</td><td>Use DataMapper(with tweeked dm-redis-adapter[2]) </td>
  </tr>
  <tr>
    <td>JRuby 1.8 / 1.9</td><td>Rails 3.0.x(use 3.0.5)</td><td>MySQL</td><td>available</td><td>Use ActiveRecord-JDBC</td>
  </tr>
  <tr>
    <td>JRuby 1.8 / 1.9</td><td>Rails 3.0.x(use 3.0.5)</td><td>PosgreSQL</td><td>available</td><td>Use ActiveRecord-JDBC</td>
  </tr>
  <tr>
    <td>JRuby 1.8 / 1.9</td><td>Rails 3.0.x(use 3.0.5)</td><td>RabbitMQ</td><td>unavailable</td><td>Use Bunny(?)</td>
  </tr>
  <tr>
    <td>JRuby 1.8 / 1.9</td><td>Rails 3.0.x(use 3.0.5)</td><td>Neo4j</td><td>unavailable</td><td>Use Neography(?)</td>
  </tr>
</table>

1. "About your application’s environment" link not working(just like rails app on cloudfoundry.com).
2. Current dm-redis-adapter depend on hiredis. so, dm-redis-adapter is unavailable on JRuby and mingw32 Ruby. 
   I tweaked the gem for independent from hiredis.

