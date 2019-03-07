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

Assume_the_Self_Weight_of_Footing = Self_Weight;
printf("Assume_the_Self_Weight_of_Footing = %d %% \n", Assume_the_Self_Weight_of_Footing)

Self_Weight_of_the_Footing = (Self_Weight/100)*(Vertical_Load_on_Column_A+Vertical_Load_on_Column_B);
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

% Shear Force is Zero at this point

x5 = Position_where_SF_is_Zero;

Bx5 = B1+(((B2-B1)/Length_of_Footing)*x5); 
Area_Ax_to_the_left_of_the_section5 = 0.5*(B1 + Bx5)*x5;


Distance_of_CG_from_section_X1_X2 = ((x5/3)*((2*B1+Bx5)/(B1+Bx5)));
disp("\n")
Maximum_Hogging_Bending_Moment = ((Load_on_Column_A*(x5 - Length_bwt_side_of_Footing_to_Center_of_Column_A)) - ((Net_Upward_Pressure*Area_Ax_to_the_left_of_the_section5)*Distance_of_CG_from_section_X1_X2));
printf("Maximum_Hogging_Bending_Moment = %d KNm \n", Maximum_Hogging_Bending_Moment)

x6 = Distance_of_Face_of_Footing_to_left_side_of_Column_A;
printf("Distance_of_Face_of_Footing_to_left_side_of_Column_A = %d mm \n", x6)

Bx6 = B1+(((B2-B1)/Length_of_Footing)*x6); 
Area_Ax_to_the_left_of_the_section6 = 0.5*(B1 + Bx6)*x6;
Distance_of_CG_from_section_X1_X2_6 = ((x6/3)*((2*B1+Bx6)/(B1+Bx6)));
Sagging_Bending_Moment_M2 = (((Net_Upward_Pressure*Area_Ax_to_the_left_of_the_section6)*Distance_of_CG_from_section_X1_X2_6));
printf("Sagging_Bending_Moment_M2 = %d KNm \n", Sagging_Bending_Moment_M2)

x7 = Distance_of_Face_of_Footing_to_right_side_of_Column_B;
printf("Distance_of_Face_of_Footing_to_right_side_of_Column_B = %d mm \n", x7)

Bx7 = B1+(((B2-B1)/Length_of_Footing)*x7);
Area_Ax_to_the_left_of_the_section7 = 0.5*(B1 + Bx7)*x7;
Distance_of_CG_from_section_X1_X2_7 = ((x7/3)*((2*B1+Bx7)/(B1+Bx7)));
Sagging_Bending_Moment_M3 = (((Net_Upward_Pressure*Area_Ax_to_the_left_of_the_section7)*Distance_of_CG_from_section_X1_X2_7)) - (Load_on_Column_A*(Distance_of_Face_of_Footing_to_right_side_of_Column_B-Length_bwt_side_of_Footing_to_Center_of_Column_A)) - (Load_on_Column_B*(Distance_of_Face_of_Footing_to_right_side_of_Column_B-(Length_bwt_side_of_Footing_to_Center_of_Column_A+Center_to_Center_Spacing_bwt_two_Column)));
printf("Sagging_Bending_Moment_M3 = %d KNm \n", Sagging_Bending_Moment_M3)

disp("\n")
disp("Effective Depth from Bending Compression")

x8 = Position_where_SF_is_Zero;

Bx8 = B1+(((B2-B1)/Length_of_Footing)*x8);

xu_max_by_d = (700)/(1100+0.87*Fy);
Ru = (0.36*Fck*xu_max_by_d*(1-0.416*xu_max_by_d));

Required_Effective_Depth = round(sqrt((1.5*Maximum_Hogging_Bending_Moment*1000000)/(Ru*Bx8*1000))/100)*100;
printf("Required_Effective_Depth = %d mm \n", Required_Effective_Depth)

Overall_Depth = round((Required_Effective_Depth + Clear_Cover)/100)*100;
printf("Overall_Depth = %d mm \n", Overall_Depth)


Provided_Effective_Depth = (Overall_Depth - Clear_Cover);
printf("Provided_Effective_Depth = %d mm \n", Provided_Effective_Depth)

disp("\n")
disp("Reinforcement in the Longitudinal Direction")
disp("Reinforment for Hogging Bending Moment")
Factored_Moment1 = 1.5*Maximum_Hogging_Bending_Moment;
Area_of_steel1 = 0.5*(Fck/Fy)*(1-sqrt(1-((4.6*Factored_Moment1*1000000)/(Fck*Bx8*1000*Provided_Effective_Depth*Provided_Effective_Depth))))*Bx8*1000*Provided_Effective_Depth;
printf("Area_of_steel = %d mm^2 \n", Area_of_steel1)

Area_of_one_steel = (pi/4)*(dia*dia);
printf("Area_of_one_steel = %d mm^2 \n", Area_of_one_steel)
No_of_Bars = round((Area_of_steel1/Area_of_one_steel)/10)*10

disp("\n")
disp("Reinforment for Sagging Bending Moment Outer Face of Column B")
x9 = Distance_of_Face_of_Footing_to_right_side_of_Column_B;
Bx9 = B1+(((B2-B1)/Length_of_Footing)*x9);

Factored_Moment3 = 1.5*Sagging_Bending_Moment_M3;
Area_of_steel3 = 0.5*(Fck/Fy)*(1-sqrt(1-((4.6*Factored_Moment3*1000000)/(Fck*Bx9*1000*Provided_Effective_Depth*Provided_Effective_Depth))))*Bx9*1000*Provided_Effective_Depth;
Minimum_Area_of_steel_3 = 0.0012*Bx9*1000*Overall_Depth;

if(Area_of_steel3<Minimum_Area_of_steel_3)
Area_of_steel3 = Minimum_Area_of_steel_3;
printf("Area_of_steel = %d mm^2 \n", Area_of_steel3)
elseif((Area_of_steel3>Minimum_Area_of_steel_3))
Area_of_steel2 = Area_of_steel3;
printf("Area_of_steel = %d mm^2 \n", Area_of_steel3)
endif

Area_of_one_steel3 = (pi/4)*(dia_saggingBM*dia_saggingBM);
printf("Area_of_one_steel = %d mm^2 \n", Area_of_one_steel3)
Spacing3 = round((Bx9*1000*Area_of_one_steel3)/Area_of_steel2/100)*100;
printf("Spacing = %d mm c/c \n", Spacing3)

disp("\n")
disp("Reinforment for Sagging Bending Moment Outer Face of Column A")
x10 = Distance_of_Face_of_Footing_to_left_side_of_Column_A;
Bx10 = B1+(((B2-B1)/Length_of_Footing)*x10);

Factored_Moment2 = 1.5*Sagging_Bending_Moment_M2;
Area_of_steel2 = 0.5*(Fck/Fy)*(1-sqrt(1-((4.6*Factored_Moment2*1000000)/(Fck*Bx10*1000*Provided_Effective_Depth*Provided_Effective_Depth))))*Bx10*1000*Provided_Effective_Depth;
Minimum_Area_of_steel_2 = 0.0012*Bx10*1000*Overall_Depth;

if(Area_of_steel2<Minimum_Area_of_steel_2)
Area_of_steel2 = Minimum_Area_of_steel_2;
printf("Area_of_steel = %d mm^2 \n", Area_of_steel2)
elseif((Area_of_steel2>Minimum_Area_of_steel_2))
Area_of_steel2 = Area_of_steel2;
printf("Area_of_steel = %d mm^2 \n", Area_of_steel2)
endif
Area_of_one_steel2 = (pi/4)*(dia_saggingBM*dia_saggingBM);
printf("Area_of_one_steel = %d mm^2 \n", Area_of_one_steel2)

Spacing2 = round((Bx10*1000*Area_of_one_steel2)/Area_of_steel2/100)*100;
printf("Spacing = %d mm c/c \n", Spacing2)

