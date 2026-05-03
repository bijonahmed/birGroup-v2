<?php

return [
    'paths' => ['api/*', 'sanctum/csrf-cookie'],

    'allowed_methods' => ['*'],

    'allowed_origins' => [
        // Production
        'https://bir-ecommerce.com',
        'https://www.bir-ecommerce.com',
		'https://admin.bir-ecommerce.com',
        // Local Development (Next.js default ports)
        'http://localhost',
        'http://localhost:3000',  // Next.js default
        'http://localhost:3001',  // Next.js alternate
        'http://localhost:8080',
        'http://127.0.0.1',
        'http://127.0.0.1:3000',
        'http://127.0.0.1:3001',
    ],

    'allowed_origins_patterns' => [
        '#^http://localhost(:\d+)?$#',   // matches any localhost port
        '#^http://127\.0\.0\.1(:\d+)?$#', // matches any 127.0.0.1 port
    ],

    'allowed_headers' => ['*'],

    'exposed_headers' => [],

    'max_age' => 0,

    'supports_credentials' => false,
];