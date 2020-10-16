@extends('layouts.app')

@section('title')
    <h1 class="text-center"> Error 404</h1>
@endsection

@section('content')

    <div class="container">
        <div class="d-flex justify-content-center align-items-center">
            <p>
                {{$errorMsg}}
            </p>
        </div>
    </div>

@endsection
