@extends('layouts.app')

@section('title')
    <img class="mx-auto d-block" src="{{ url('/assets/img/hotel.png') }}"/>
    <h1 class="mt-3 text-center"> {{ $data['hotel']->hotelName }} </h1>
@endsection

@section('content')

    <div class="container">
        <div class="row">
            <p class="lead mt-2">
                {{ $data['hotel']->hotelDescription }}
            </p>
        </div>
        <dl class="row mt-3 mb-4">
            <dt class="col-sm-2">Correo electrónico:</dt>
            <dd class="col-sm-10">{{ $data['hotel']->hotelEmail }}</dd>
            <dt class="col-sm-2">Teléfono:</dt>
            <dd class="col-sm-10">{{ $data['hotel']->hotelPhone }}</dd>
            <dt class="col-sm-2">Ubicación:</dt>
            <dd class="col-sm-10">{{ $data['hotel']->hotelAddress }}, {{ $data['hotel']->hotelLocality }}, {{ $data['hotel']->hotelPostCode }} {{ $data['hotel']->hotelCity }}, {{ $data['hotel']->hotelCountry }}</dd>
            <dt class="col-sm-2">Valoración Media:</dt>
            <dd class="col-sm-10">{{ $data['hotel']->hotelRate }} / 10</dd>
        </dl>
        @if (count($data['hotel']->facilities) > 0)
            <div class="row mt-3">
                <h3>Servicios más populares</h3>
            </div>
            <div class="row mt-3">
                <ul class="list-group list-group-horizontal-sm">
                    @foreach($data['hotel']->facilities as $facility)
                    <li class="list-group-item bg-light">{{ $facility->facilityName }}</li>
                    @endforeach
                </ul>
            </div>
        @endif
        <div class="row mt-5">
            <img class="mr-2" src="{{ url('/assets/img/rooms.png') }}"/> <h3>Habitaciones</h3>
        </div>
        @if (count($data['hotel']->rooms) > 0)
        <div class="row mt-3">
            <div class="accordion w-100" id="accordionExample">
                @foreach($data['hotel']->rooms as $index => $room)
                    <div class="card">
                        <div class="card-header" id="heading{{$index}}">
                            <h2 class="mb-0">
                                <button class="btn btn-link btn-block text-left" type="button" data-toggle="collapse" data-target="#collapse{{$index}}" aria-expanded="true" aria-controls="collapse{{$index}}">
                                    {{ $room->roomDescription }}
                                </button>
                            </h2>
                        </div>

                        <div id="collapse{{$index}}" class="collapse" aria-labelledby="heading{{$index}}" data-parent="#accordionExample">
                            <div class="card-body">
                                <dl class="row">
                                    <dt class="col-sm-3">Planta:</dt>
                                    <dd class="col-sm-9">{{ $room->roomFloor }}</dd>
                                    <dt class="col-sm-3">Disponible:</dt>
                                    <dd class="col-sm-9">@if ($room->roomIsAvailable) <i class="fas fa-check"></i> @else <i class="fas fa-times"></i> @endif</dd>
                                    <dt class="col-sm-3">Tipo habitación:</dt>
                                    <dd class="col-sm-9">{{ $room->roomType->roomTypeName }}</dd>
                                    <dt class="col-sm-3">Descripción:</dt>
                                    <dd class="col-sm-9">{{ $room->roomType->roomTypeDescription }}</dd>
                                    <dt class="col-sm-3">Capacidad:</dt>
                                    <dd class="col-sm-9">{{ $room->roomType->roomTypeSleeps }} personas</dd>
                                    <dt class="col-sm-3">Permitido fumar:</dt>
                                    <dd class="col-sm-9">@if ($room->roomType->roomTypeSmokingIsAllowed) <i class="fas fa-check"></i> @else <i class="fas fa-times"></i> @endif</dd>
                                </dl>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
        @else
            <p class="text-center">No existen habitaciones disponibles.</p>
        @endif
        <div class="row mt-5">
            <img class="mr-2" src="{{ url('/assets/img/user.png') }}"/> <h3>Usuarios que han reservado habitaciones en el hotel</h3>
        </div>
        @if (count($data['hotel']->bookings) > 0)
        <div class="row mt-3">
            <div class="table-responsive-sm">
                <table class="table">
                    <thead>
                    <tr>
                        <th scope="col">Huésped</th>
                        <th scope="col">Email</th>
                        <th scope="col">Fecha Reserva</th>
                        <th scope="col">Estatus</th>
                        <th scope="col">Habitaciones</th>
                        <th scope="col">Importe</th>
                    </tr>
                    </thead>
                    <tbody>
                    @foreach($data['hotel']->bookings as $booking)
                        <tr>
                            <td>{{ $booking->guest->guestFirstName }} {{ $booking->guest->guestLastName }}</td>
                            <td>{{ $booking->guest->guestEmail }}</td>
                            <td>{{ Carbon\Carbon::parse($booking->bookingFrom)->format('m/d/Y') }} - {{ Carbon\Carbon::parse($booking->bookingTo)->format('m/d/Y') }} </td>
                            <td>{{ $booking->bookingStatus->bookingStatusName }}</td>
                            <td>
                            @php
                                $import = 0;
                            @endphp
                            @foreach($booking->rooms as $room)
                                @php
                                    $import += $room->bookingrooms->bookingRoomPrice;
                                @endphp
                                ({{ $room->bookingrooms->bookingRoomQty }}) {{ $room->roomDescription }} <br>
                            @endforeach
                            </td>
                            <td>
                                {{ $import }}€
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table>
            </div>
        </div>
        @else
            <p class="text-center">No hay reservas para este hotel.</p>
        @endif
    </div>

@endsection
