<?php

namespace App\Http\Controllers;

use App\Models\Guest;
use App\Models\Hotel;
use Illuminate\Http\Request;

class HotelController extends Controller
{
    public function __construct(Hotel $hotel)
    {
        $this->hotel = $hotel;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Hotel $hotel)
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        try {
            $data = $this->getHotel($id);

            return view('hotel')->with('data', $data);

        }catch(\Exception $e){

            $errorMsg = "Sorry, the hotel ID you were looking for at this URL was not found.";
            return view('errors.404', compact('errorMsg'));
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    /**
     * API
     * Return hotel details by ID
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function getHotel($id)
    {
        $hotel = Hotel::find($id);

        //Validate if the hotel ID not exists to show a NotFoundHttpException
        if (!$hotel) {
            abort(404);
        }

        $facilities = $hotel->facilities;
        $rooms = $hotel->rooms;
        $bookings = $hotel->bookings;

        $data = [
            "hotel" => $hotel,
            "facilities" => $facilities,
            "rooms" => $rooms,
            "bookings" => $bookings
        ];

        return $data;
    }
}
