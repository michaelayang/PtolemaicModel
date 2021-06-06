BEGIN			{
			  PI = 3.14159265;
			  count = 0;
			}

function sgn(x)		{ return sqrt(x*x)/x; }

function acos(x)	{ return atan2(sqrt(1-x^2), x); }

function asin(x)	{ return atan2(x, sqrt(1-x^2)); }

function radToDeg(x)	{ return x*180.0/PI; }

function degToRad(x)	{ return x*PI/180.0; }

			{
			  dec_0 = 23.4;
			  #dec_0 = 23.436952;
			  ar_0 = 6;
			  #ar_0 = 5.988259;

			  dec_0_radians = dec_0*PI/180.0;
			  ar_0_radians = ar_0*2.0*PI/24.0;

			  basis_x1 = 1.0;
			  basis_y1 = 0;
			  basis_z1 = 0;
			  basis_dec_x1 = 1.0*cos(dec_0_radians);
			  basis_dec_y1 = 0;
			  basis_dec_z1 = 1.0*sin(dec_0_radians);
			  basis_vector_x1 = basis_dec_x1*cos(ar_0_radians);
			  basis_vector_y1 = basis_dec_x1*sin(ar_0_radians);
			  basis_vector_z1 = basis_dec_z1;

			  #printf("(%f,%f,%f)\n", basis_vector_x1, basis_vector_y1, basis_vector_z1);

			  basis_x2 = 0;
			  basis_y2 = 1.0;
			  basis_z2 = 0;
			  basis_dec_x2 = 0;
			  basis_dec_y2 = 1.0;
			  basis_dec_z2 = 0;
			  basis_vector_x2 = -basis_dec_y2*sin(ar_0_radians);
			  basis_vector_y2 = basis_dec_y2*cos(ar_0_radians);
			  basis_vector_z2 = basis_dec_z2;

			  #printf("(%f,%f,%f)\n", basis_vector_x2, basis_vector_y2, basis_vector_z2);

			  basis_x1 = 0;
			  basis_y1 = 0;
			  basis_z1 = 1.0;
			  basis_dec_x3 = 1.0*sin(dec_0_radians);
			  basis_dec_y3 = 0;
			  basis_dec_z3 = 1.0*cos(dec_0_radians);
			  basis_vector_x3 = basis_dec_x3*cos(ar_0_radians);
			  basis_vector_y3 = -basis_dec_x3*sin(ar_0_radians);
			  basis_vector_z3 = basis_dec_z3;

			  #printf("(%f,%f,%f)\n", basis_vector_x3, basis_vector_y3, basis_vector_z3);

			  dec_radians = $2*PI/180.0;
			  ar_radians = $1*2.0*PI/24.0;
			  dec_x = 1.0*cos(dec_radians);
			  dec_y = 0;
			  dec_z = 1.0*sin(dec_radians);
			  vector_x = dec_x*cos(ar_radians);
			  vector_y = dec_x*sin(ar_radians);
			  vector_z = dec_z;

			  coord_transform_x = basis_vector_x1*vector_x + basis_vector_y1*vector_y + basis_vector_z1*vector_z;
			  coord_transform_y = basis_vector_x2*vector_x + basis_vector_y2*vector_y + basis_vector_z2*vector_z;
			  coord_transform_z = basis_vector_x3*vector_x + basis_vector_y3*vector_y + basis_vector_z3*vector_z;

                          ar = atan2(coord_transform_y, coord_transform_x);
                          dec = atan2(coord_transform_z, sqrt(coord_transform_x^2 + coord_transform_y^2));

			  printf("%d,%f,%f,%f,%f\n", count, radToDeg(ar), radToDeg(dec), $1, $2);
			  count++;
			}
