
ini_open( "data.ini" )
    number_hash =  real( base64_decode( ini_read_string( "game", "score", base64_encode("0") ) ) );
    hash = real( base64_decode( ini_read_string( "game", "not the score", base64_encode("1") ) ) );
ini_close()

number = number_hash / hash;

if ( number > 999 ){
    number = 0;
}
if ( number < 0 ){
    number = 0;
}

// check hash number
start_number = number;

save_1 = ds_list_create();
save_2 = ds_list_create();

i = 1;

if ( number ){
    while( ( number % 2 ) == 0 ){
    
        ds_list_add( save_1, i );
        number = number / 2;
        i++;
    
    }
    while( ( number % 3 ) == 0 ){
        
        ds_list_add( save_2, i );
        number = number / 3;
        i++;
    
    }
}

sum = i * number;

for( var j = 0; j < ds_list_size( save_1 ); j++ ){
    sum += ( ds_list_find_value( save_1, j ) * 2 );
}
for( var j = 0; j < ds_list_size( save_2 ); j++ ){
    sum += ( ds_list_find_value( save_2, j ) * 3 );
}

if ( sum != hash ){
    number = 0;
}

string_number = string( start_number );
if ( start_number < 10 ){
    string_number = string_insert( "0", string_number, 0 );
}
if ( start_number < 100 ){
    string_number = string_insert( "0", string_number, 0 );
}


return string_number;
