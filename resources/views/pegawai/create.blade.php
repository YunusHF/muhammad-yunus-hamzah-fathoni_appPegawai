@extends('layout.app')
@section('title', 'Buat Pegawai Baru')
@section('content')
<div class="wrapper">
  <h1>Input Pegawai Baru</h1>
  
  @if (session('success'))
  <div class="alert-success">
    <p>{{ session('success') }}</p>
  </div>
  @endif
  
  @if ($errors->any())
  <div class="alert-danger">
    <ul>
      @foreach ($errors->all() as $error)
      <li>{{ $error }}</li>
      @endforeach
    </ul>
  </div>
  @endif
  
  <form method="POST" action="{{ url('pegawai') }}">
    @csrf
    <label for="nip">NIP:</label>
    <input id="nip" name="nip" type="text" placeholder="NIP"><br> 
    <label for="nama">NAMA:</label>
    <input id="nama" name="nama" type="text" placeholder="Nama Lengkap"><br>
    <label for="jenis_kelamin">Jens Kelamin:</label>
    <select id="jenis_kelamin" name="jenis_kelamin">
      <option value="L">Laki-laki</option>
      <option value="P">Perempuan</option>
    </select><br>
    <label for="unit_kerja">Unit Kerja:</label>
    <input id="unit_kerja" name="unit_kerja" type="text" placeholder="Unit Kerja"><br>
    <button class="btn-blue">Submit</button>
  </form>
</div>
@endsection