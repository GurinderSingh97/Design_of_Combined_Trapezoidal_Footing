% Design of Combined Trapezoidal Footing
clc
clear
format short g

load input.mat

disp ("Design of Combined Trapezoidal Footing \n")

%Compute the Area of Footing 
Vertical_Load_on_Column_A = Load_on_Column_A;
printf("Vertical_Load_on_Column_A = %d KN \n", Vertical_Load_on_Column_A)

Vertical_Load_on_Column_B = Load_on_Column_B;
printf("Vertical_Load_on_Column_B = %d KN \n", Vertical_Load_on_Column_B)

Assume_the_Self_Weight_of_Footing = Self_Weight*100;
printf("Assume_the_Self_Weight_of_Footing = %d %% \n", Assume_the_Self_Weight_of_Footing)

Self_Weight_of_the_Footing = Self_Weight*(Vertical_Load_on_Column_A+Vertical_Load_on_Column_B);
printf("Self_Weight_of_the_Footing = %d KN \n", Self_Weight_of_the_Footing)

Total_Load = Vertical_Load_on_Column_A + Vertical_Load_on_Column_B + Self_Weight_of_the_Footing; 
printf("Total_Load = %d KN \n", Total_Load)
disp("\n")

Length_of_Footing = Length_of_the_Footing;
printf("Length_of_Footing = %d m \n", Length_of_Footing)
 
Center_to_Center_Spacing_bwt_two_Column = Center_to_Center_Spacing_bwt_two_Column;
printf("Center_to_Center_Spacing_bwt_two_Column = %d m \n", Center_to_Center_Spacing_bwt_two_Column)

Length_bwt_side_of_Footing_to_Center_of_Column_A = 0.5*(Length_of_Footing - Center_to_Center_Spacing_bwt_two_Column);
printf("Length_bwt_side_of_Footing_to_Center_of_Column_A = %d m \n", Length_bwt_side_of_Footing_to_Center_of_Column_A)

Length_bwt_side_of_Footing_to_Center_of_Column_B = 0.5*(Length_of_Footing - Center_to_Center_Spacing_bwt_two_Column);
printf("Length_bwt_side_of_Footing_to_Center_of_Column_B = %d m \n", Length_bwt_side_of_Footing_to_Center_of_Column_B)

disp("\n")
B1_plus_B2 = round(((Load_on_Column_A + Load_on_Column_B + Self_Weight_of_the_Footing)*2)/(Soil_Pressure*Length_of_the_Footing));


Distance_of_CG_of_Load = ((Load_on_Column_B*Center_to_Center_Spacing_bwt_two_Column)/(Load_on_Column_A + Load_on_Column_B));
printf("Distance_of_CG_of_Load = %d m \n", Distance_of_CG_of_Load)

Distance_of_CG_of_Load_from_edge_B1 = Length_bwt_side_of_Footing_to_Center_of_Column_A + Distance_of_CG_of_Load;
printf("Distance_of_CG_of_Load_from_edge_B1 = %d m \n", Distance_of_CG_of_Load_from_edge_B1)

B1 = -(((Distance_of_CG_of_Load_from_edge_B1*Distance_of_CG_of_Load*B1_plus_B2)/Length_of_Footing)-(2*Distance_of_CG_of_Load_from_edge_B1));
printf("Width_of_Shorter_Side_of_Footing = %d m \n", B1)

B2 = B1_plus_B2 - B1;
printf("Width_of_Longer_Side_of_Footing = %d m \n", B2) 

disp("\n")
Net_Upward_Pressure = round((Load_on_Column_A+Load_on_Column_B)/(0.5*(B1+B2)*Length_of_Footing)/10)*10;
printf("Net_Upward_Pressure = %d KN/m^2 \n", Net_Upward_Pressure)

% Compute the Shear Force
disp("\n")
disp("Shear Force")
Distance_of_Face_of_Footing_to_left_side_of_Column_A = Length_bwt_side_of_Footing_to_Center_of_Column_A - (Width1_of_Column_A/2);
printf("Distance_of_Face_of_Footing_to_left_side_of_Column_A = %d m \n", Distance_of_Face_of_Footing_to_left_side_of_Column_A)

x1 = Distance_of_Face_of_Footing_to_left_side_of_Column_A;
Bx1 = B1+(((B2-B1)/Length_of_Footing)*x1);

Area_Ax_to_the_left_of_the_section1 = 0.5*(B1 + Bx1)*x1;

Total_Upward_Pressure = Net_Upward_Pressure*Area_Ax_to_the_left_of_the_section1;

Shear_Force_at_outer_face_of_Column_A = Net_Upward_Pressure*Area_Ax_to_the_left_of_the_section1;
printf("Shear_Force_at_outer_face_of_Column_A = %d KN \n", Shear_Force_at_outer_face_of_Column_A)

disp("\n")

Distance_of_Face_of_Footing_to_right_side_of_Column_A = Length_bwt_side_of_Footing_to_Center_of_Column_A+(Width1_of_Column_A/2);
printf("Distance_of_Face_of_Footing_to_right_side_of_Column_A = %d m \n", Distance_of_Face_of_Footing_to_right_side_of_Column_A)

x2 = Distance_of_Face_of_Footing_to_right_side_of_Column_A;
Bx2 = B1+(((B2-B1)/Length_of_Footing)*x2);
Area_Ax_to_the_left_of_the_section2 = 0.5*(B1 + Bx2)*x2;

Shear_Force_at_inner_face_of_Column_A = Load_on_Column_A-(Net_Upward_Pressure*Area_Ax_to_the_left_of_the_section2);
printf("Shear_Force_at_inner_face_of_Column_A = %d KN \n", Shear_Force_at_inner_face_of_Column_A)

disp("\n")

Distance_of_Face_of_Footing_to_left_side_of_Column_B = ((Length_bwt_side_of_Footing_to_Center_of_Column_A)+(Center_to_Center_Spacing_bwt_two_Column)-(Width1_of_Column_B/2));
printf("Distance_of_Face_of_Footing_to_left_side_of_Column_B = %d m \n", Distance_of_Face_of_Footing_to_left_side_of_Column_B)

x3 = Distance_of_Face_of_Footing_to_left_side_of_Column_B;
Bx3 = B1+(((B2-B1)/Length_of_Footing)*x3);
Area_Ax_to_the_left_of_the_section3 = 0.5*(B1 + Bx3)*x3;

Shear_Force_at_inner_face_of_Column_B = Load_on_Column_A-(Net_Upward_Pressure*Area_Ax_to_the_left_of_the_section3);
printf("Shear_Force_at_inner_face_of_Column_B = %d KN \n", Shear_Force_at_inner_face_of_Column_B)

disp("\n")

Distance_of_Face_of_Footing_to_right_side_of_Column_B = ((Length_bwt_side_of_Footing_to_Center_of_Column_A)+(Center_to_Center_Spacing_bwt_two_Column)+(Width1_of_Column_B/2));
printf("Distance_of_Face_of_Footing_to_right_side_of_Column_B = %d m \n", Distance_of_Face_of_Footing_to_right_side_of_Column_B)

x4 = Distance_of_Face_of_Footing_to_right_side_of_Column_B;
Bx4 = B1+(((B2-B1)/Length_of_Footing)*x4);
Area_Ax_to_the_left_of_the_section4 = 0.5*(B1 + Bx4)*x4;

Shear_Force_at_outer_face_of_Column_B = Load_on_Column_A-(Net_Upward_Pressure*Area_Ax_to_the_left_of_the_section4)+Load_on_Column_B;
printf("Shear_Force_at_outer_face_of_Column_B = %d KN \n", Shear_Force_at_outer_face_of_Column_B)
