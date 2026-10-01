<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Better Products, Brighter Living | NexioMart</title>
    <meta name="description"
        content="NexioMart – quality products across Bangladesh with cash on delivery and easy returns.">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;600;700&display=swap" rel="stylesheet">
    <script src="https://cdn.tailwindcss.com"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        sans: ['Poppins', 'system-ui', 'sans-serif']
                    },
                    colors: {
                        star: '#f5a524',
                        brand: {
                            50: '#eef7f0',
                            100: '#d9eddd',
                            200: '#b5dbbd',
                            500: '#1a9447',
                            600: '#0e7d3b',
                            700: '#0a6530',
                            800: '#0a4a26',
                            900: '#073a1d'
                        }
                    }
                }
            }
        }
    </script>
    <link rel="stylesheet" href="{{ asset('frontend/assets/css/style.css') }}">
</head>

<body class="font-sans text-slate-700 bg-white">
    @include('frontend.partials.header')
    <div id="overlay" class="fixed inset-0 bg-black/50 z-50"></div>
    @include('frontend.partials.mobile_menu')
    <main>

        @yield('content')

    </main>
    @include('frontend.partials.footer')
    <script src="{{ asset('frontend/assets/js/main.js') }}"></script>
</body>

</html>
