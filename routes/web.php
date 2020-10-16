<?php

/** @var \Laravel\Lumen\Routing\Router $router */

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It is a breeze. Simply tell Lumen the URIs it should respond to
| and give it the Closure to call when that URI is requested.
|
*/

$router->get('/', function () use ($router) {
    return $router->app->version();
});

//Hotel API routes
$router->get('thn_test/api/hotels/{id}', 'HotelController@getHotel');

//Hotel routes to render a view
$router->get('thn_test/hotels/{id}', 'HotelController@show');
