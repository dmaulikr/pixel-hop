hundred = argument0;
ten = argument1;
single = argument2;

number = real( string( hundred ) + string( ten ) + string( single ) );

start_number = number;

save_1 = ds_list_create();
save_2 = ds_list_create();

i = 1;

while( number mod 2 == 0 ){
    
    ds_list_add( save_1, i );
    number = number / 2;
    i++;

}
while( number mod 3 == 0){
    
    ds_list_add( save_2, i );
    number = number / 3;
    i++;

}

sum = i * number;

for( var j = 0; j < ds_list_size( save_1 ); j++ ){
    sum += ( ds_list_find_value( save_1, j ) * 2 );
}
for( var j = 0; j < ds_list_size( save_2 ); j++ ){
    sum += ( ds_list_find_value( save_2, j ) * 3 );
}

number_hashed = start_number * sum;
hash = sum;

ini_open( "data.ini" )
    ini_write_string( "game", "score", base64_encode( string( number_hashed ) ) );
    ini_write_string( "game", "not the score", base64_encode( string( hash ) ) );
ini_close()

