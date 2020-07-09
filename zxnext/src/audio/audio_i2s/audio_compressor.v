//============================================================================
//  Audio compressor (signed samples)
// 
//  Copyright (C) 2018 Sorgelig
//
//  This program is free software; you can redistribute it and/or modify it
//  under the terms of the GNU General Public License as published by the Free
//  Software Foundation; either version 2 of the License, or (at your option)
//  any later version.
//
//  This program is distributed in the hope that it will be useful, but WITHOUT
//  ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
//  FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
//  more details.
//
//  You should have received a copy of the GNU General Public License along
//  with this program; if not, write to the Free Software Foundation, Inc.,
//  51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
//============================================================================

module audio_compressor
(
	input         clk,
	input      [11:0] in1, in2,
	output reg [15:0] out1, out2
);

always @(posedge clk) out1 <= {in1[11], in1[11] ? ~tbl[~in1[10:0]] : tbl[in1[10:0]]};
always @(posedge clk) out2 <= {in2[11], in2[11] ? ~tbl[~in2[10:0]] : tbl[in2[10:0]]};

wire [14:0] tbl[0:2047] = 
{
	//sin(x)
 15'h0000, 15'h0019, 15'h0032, 15'h004B, 15'h0064, 15'h007D, 15'h0096, 15'h00B0, 15'h00C9, 15'h00E2, 15'h00FB, 15'h0114, 15'h012D, 15'h0146, 15'h0160, 15'h0179,
 15'h0192, 15'h01AB, 15'h01C4, 15'h01DD, 15'h01F6, 15'h0210, 15'h0229, 15'h0242, 15'h025B, 15'h0274, 15'h028D, 15'h02A6, 15'h02BF, 15'h02D9, 15'h02F2, 15'h030B,
 15'h0324, 15'h033D, 15'h0356, 15'h036F, 15'h0389, 15'h03A2, 15'h03BB, 15'h03D4, 15'h03ED, 15'h0406, 15'h041F, 15'h0439, 15'h0452, 15'h046B, 15'h0484, 15'h049D,
 15'h04B6, 15'h04CF, 15'h04E8, 15'h0502, 15'h051B, 15'h0534, 15'h054D, 15'h0566, 15'h057F, 15'h0598, 15'h05B1, 15'h05CB, 15'h05E4, 15'h05FD, 15'h0616, 15'h062F,
 15'h0648, 15'h0661, 15'h067A, 15'h0693, 15'h06AD, 15'h06C6, 15'h06DF, 15'h06F8, 15'h0711, 15'h072A, 15'h0743, 15'h075C, 15'h0775, 15'h078E, 15'h07A8, 15'h07C1,
 15'h07DA, 15'h07F3, 15'h080C, 15'h0825, 15'h083E, 15'h0857, 15'h0870, 15'h0889, 15'h08A3, 15'h08BC, 15'h08D5, 15'h08EE, 15'h0907, 15'h0920, 15'h0939, 15'h0952,
 15'h096B, 15'h0984, 15'h099D, 15'h09B6, 15'h09CF, 15'h09E9, 15'h0A02, 15'h0A1B, 15'h0A34, 15'h0A4D, 15'h0A66, 15'h0A7F, 15'h0A98, 15'h0AB1, 15'h0ACA, 15'h0AE3,
 15'h0AFC, 15'h0B15, 15'h0B2E, 15'h0B47, 15'h0B60, 15'h0B79, 15'h0B92, 15'h0BAC, 15'h0BC5, 15'h0BDE, 15'h0BF7, 15'h0C10, 15'h0C29, 15'h0C42, 15'h0C5B, 15'h0C74,
 15'h0C8D, 15'h0CA6, 15'h0CBF, 15'h0CD8, 15'h0CF1, 15'h0D0A, 15'h0D23, 15'h0D3C, 15'h0D55, 15'h0D6E, 15'h0D87, 15'h0DA0, 15'h0DB9, 15'h0DD2, 15'h0DEB, 15'h0E04,
 15'h0E1D, 15'h0E36, 15'h0E4F, 15'h0E68, 15'h0E81, 15'h0E9A, 15'h0EB3, 15'h0ECC, 15'h0EE5, 15'h0EFE, 15'h0F17, 15'h0F30, 15'h0F49, 15'h0F62, 15'h0F7B, 15'h0F94,
 15'h0FAC, 15'h0FC5, 15'h0FDE, 15'h0FF7, 15'h1010, 15'h1029, 15'h1042, 15'h105B, 15'h1074, 15'h108D, 15'h10A6, 15'h10BF, 15'h10D8, 15'h10F1, 15'h110A, 15'h1123,
 15'h113B, 15'h1154, 15'h116D, 15'h1186, 15'h119F, 15'h11B8, 15'h11D1, 15'h11EA, 15'h1203, 15'h121C, 15'h1234, 15'h124D, 15'h1266, 15'h127F, 15'h1298, 15'h12B1,
 15'h12CA, 15'h12E3, 15'h12FB, 15'h1314, 15'h132D, 15'h1346, 15'h135F, 15'h1378, 15'h1391, 15'h13A9, 15'h13C2, 15'h13DB, 15'h13F4, 15'h140D, 15'h1426, 15'h143E,
 15'h1457, 15'h1470, 15'h1489, 15'h14A2, 15'h14BB, 15'h14D3, 15'h14EC, 15'h1505, 15'h151E, 15'h1537, 15'h154F, 15'h1568, 15'h1581, 15'h159A, 15'h15B3, 15'h15CB,
 15'h15E4, 15'h15FD, 15'h1616, 15'h162E, 15'h1647, 15'h1660, 15'h1679, 15'h1691, 15'h16AA, 15'h16C3, 15'h16DC, 15'h16F4, 15'h170D, 15'h1726, 15'h173F, 15'h1757,
 15'h1770, 15'h1789, 15'h17A1, 15'h17BA, 15'h17D3, 15'h17EC, 15'h1804, 15'h181D, 15'h1836, 15'h184E, 15'h1867, 15'h1880, 15'h1898, 15'h18B1, 15'h18CA, 15'h18E2,
 15'h18FB, 15'h1914, 15'h192C, 15'h1945, 15'h195E, 15'h1976, 15'h198F, 15'h19A8, 15'h19C0, 15'h19D9, 15'h19F2, 15'h1A0A, 15'h1A23, 15'h1A3B, 15'h1A54, 15'h1A6D,
 15'h1A85, 15'h1A9E, 15'h1AB6, 15'h1ACF, 15'h1AE8, 15'h1B00, 15'h1B19, 15'h1B31, 15'h1B4A, 15'h1B62, 15'h1B7B, 15'h1B94, 15'h1BAC, 15'h1BC5, 15'h1BDD, 15'h1BF6,
 15'h1C0E, 15'h1C27, 15'h1C3F, 15'h1C58, 15'h1C70, 15'h1C89, 15'h1CA1, 15'h1CBA, 15'h1CD2, 15'h1CEB, 15'h1D03, 15'h1D1C, 15'h1D34, 15'h1D4D, 15'h1D65, 15'h1D7E,
 15'h1D96, 15'h1DAF, 15'h1DC7, 15'h1DE0, 15'h1DF8, 15'h1E10, 15'h1E29, 15'h1E41, 15'h1E5A, 15'h1E72, 15'h1E8B, 15'h1EA3, 15'h1EBB, 15'h1ED4, 15'h1EEC, 15'h1F05,
 15'h1F1D, 15'h1F35, 15'h1F4E, 15'h1F66, 15'h1F7F, 15'h1F97, 15'h1FAF, 15'h1FC8, 15'h1FE0, 15'h1FF8, 15'h2011, 15'h2029, 15'h2041, 15'h205A, 15'h2072, 15'h208A,
 15'h20A3, 15'h20BB, 15'h20D3, 15'h20EC, 15'h2104, 15'h211C, 15'h2134, 15'h214D, 15'h2165, 15'h217D, 15'h2196, 15'h21AE, 15'h21C6, 15'h21DE, 15'h21F7, 15'h220F,
 15'h2227, 15'h223F, 15'h2257, 15'h2270, 15'h2288, 15'h22A0, 15'h22B8, 15'h22D1, 15'h22E9, 15'h2301, 15'h2319, 15'h2331, 15'h2349, 15'h2362, 15'h237A, 15'h2392,
 15'h23AA, 15'h23C2, 15'h23DA, 15'h23F3, 15'h240B, 15'h2423, 15'h243B, 15'h2453, 15'h246B, 15'h2483, 15'h249B, 15'h24B3, 15'h24CB, 15'h24E4, 15'h24FC, 15'h2514,
 15'h252C, 15'h2544, 15'h255C, 15'h2574, 15'h258C, 15'h25A4, 15'h25BC, 15'h25D4, 15'h25EC, 15'h2604, 15'h261C, 15'h2634, 15'h264C, 15'h2664, 15'h267C, 15'h2694,
 15'h26AC, 15'h26C4, 15'h26DC, 15'h26F4, 15'h270C, 15'h2724, 15'h273C, 15'h2754, 15'h276C, 15'h2783, 15'h279B, 15'h27B3, 15'h27CB, 15'h27E3, 15'h27FB, 15'h2813,
 15'h282B, 15'h2843, 15'h285A, 15'h2872, 15'h288A, 15'h28A2, 15'h28BA, 15'h28D2, 15'h28EA, 15'h2901, 15'h2919, 15'h2931, 15'h2949, 15'h2961, 15'h2978, 15'h2990,
 15'h29A8, 15'h29C0, 15'h29D7, 15'h29EF, 15'h2A07, 15'h2A1F, 15'h2A36, 15'h2A4E, 15'h2A66, 15'h2A7E, 15'h2A95, 15'h2AAD, 15'h2AC5, 15'h2ADC, 15'h2AF4, 15'h2B0C,
 15'h2B24, 15'h2B3B, 15'h2B53, 15'h2B6B, 15'h2B82, 15'h2B9A, 15'h2BB1, 15'h2BC9, 15'h2BE1, 15'h2BF8, 15'h2C10, 15'h2C28, 15'h2C3F, 15'h2C57, 15'h2C6E, 15'h2C86,
 15'h2C9D, 15'h2CB5, 15'h2CCD, 15'h2CE4, 15'h2CFC, 15'h2D13, 15'h2D2B, 15'h2D42, 15'h2D5A, 15'h2D71, 15'h2D89, 15'h2DA0, 15'h2DB8, 15'h2DCF, 15'h2DE7, 15'h2DFE,
 15'h2E16, 15'h2E2D, 15'h2E45, 15'h2E5C, 15'h2E73, 15'h2E8B, 15'h2EA2, 15'h2EBA, 15'h2ED1, 15'h2EE9, 15'h2F00, 15'h2F17, 15'h2F2F, 15'h2F46, 15'h2F5D, 15'h2F75,
 15'h2F8C, 15'h2FA3, 15'h2FBB, 15'h2FD2, 15'h2FE9, 15'h3001, 15'h3018, 15'h302F, 15'h3047, 15'h305E, 15'h3075, 15'h308C, 15'h30A4, 15'h30BB, 15'h30D2, 15'h30E9,
 15'h3101, 15'h3118, 15'h312F, 15'h3146, 15'h315E, 15'h3175, 15'h318C, 15'h31A3, 15'h31BA, 15'h31D1, 15'h31E9, 15'h3200, 15'h3217, 15'h322E, 15'h3245, 15'h325C,
 15'h3273, 15'h328A, 15'h32A2, 15'h32B9, 15'h32D0, 15'h32E7, 15'h32FE, 15'h3315, 15'h332C, 15'h3343, 15'h335A, 15'h3371, 15'h3388, 15'h339F, 15'h33B6, 15'h33CD,
 15'h33E4, 15'h33FB, 15'h3412, 15'h3429, 15'h3440, 15'h3457, 15'h346E, 15'h3485, 15'h349C, 15'h34B3, 15'h34CA, 15'h34E1, 15'h34F7, 15'h350E, 15'h3525, 15'h353C,
 15'h3553, 15'h356A, 15'h3581, 15'h3597, 15'h35AE, 15'h35C5, 15'h35DC, 15'h35F3, 15'h360A, 15'h3620, 15'h3637, 15'h364E, 15'h3665, 15'h367B, 15'h3692, 15'h36A9,
 15'h36C0, 15'h36D6, 15'h36ED, 15'h3704, 15'h371A, 15'h3731, 15'h3748, 15'h375E, 15'h3775, 15'h378C, 15'h37A2, 15'h37B9, 15'h37D0, 15'h37E6, 15'h37FD, 15'h3814,
 15'h382A, 15'h3841, 15'h3857, 15'h386E, 15'h3884, 15'h389B, 15'h38B2, 15'h38C8, 15'h38DF, 15'h38F5, 15'h390C, 15'h3922, 15'h3939, 15'h394F, 15'h3966, 15'h397C,
 15'h3993, 15'h39A9, 15'h39BF, 15'h39D6, 15'h39EC, 15'h3A03, 15'h3A19, 15'h3A30, 15'h3A46, 15'h3A5C, 15'h3A73, 15'h3A89, 15'h3A9F, 15'h3AB6, 15'h3ACC, 15'h3AE2,
 15'h3AF9, 15'h3B0F, 15'h3B25, 15'h3B3C, 15'h3B52, 15'h3B68, 15'h3B7F, 15'h3B95, 15'h3BAB, 15'h3BC1, 15'h3BD7, 15'h3BEE, 15'h3C04, 15'h3C1A, 15'h3C30, 15'h3C47,
 15'h3C5D, 15'h3C73, 15'h3C89, 15'h3C9F, 15'h3CB5, 15'h3CCB, 15'h3CE2, 15'h3CF8, 15'h3D0E, 15'h3D24, 15'h3D3A, 15'h3D50, 15'h3D66, 15'h3D7C, 15'h3D92, 15'h3DA8,
 15'h3DBE, 15'h3DD4, 15'h3DEA, 15'h3E00, 15'h3E16, 15'h3E2C, 15'h3E42, 15'h3E58, 15'h3E6E, 15'h3E84, 15'h3E9A, 15'h3EB0, 15'h3EC6, 15'h3EDC, 15'h3EF2, 15'h3F08,
 15'h3F1D, 15'h3F33, 15'h3F49, 15'h3F5F, 15'h3F75, 15'h3F8B, 15'h3FA1, 15'h3FB6, 15'h3FCC, 15'h3FE2, 15'h3FF8, 15'h400E, 15'h4023, 15'h4039, 15'h404F, 15'h4065,
 15'h407A, 15'h4090, 15'h40A6, 15'h40BB, 15'h40D1, 15'h40E7, 15'h40FC, 15'h4112, 15'h4128, 15'h413D, 15'h4153, 15'h4169, 15'h417E, 15'h4194, 15'h41A9, 15'h41BF,
 15'h41D5, 15'h41EA, 15'h4200, 15'h4215, 15'h422B, 15'h4240, 15'h4256, 15'h426B, 15'h4281, 15'h4296, 15'h42AC, 15'h42C1, 15'h42D7, 15'h42EC, 15'h4301, 15'h4317,
 15'h432C, 15'h4342, 15'h4357, 15'h436C, 15'h4382, 15'h4397, 15'h43AC, 15'h43C2, 15'h43D7, 15'h43EC, 15'h4402, 15'h4417, 15'h442C, 15'h4442, 15'h4457, 15'h446C,
 15'h4481, 15'h4497, 15'h44AC, 15'h44C1, 15'h44D6, 15'h44EB, 15'h4501, 15'h4516, 15'h452B, 15'h4540, 15'h4555, 15'h456A, 15'h4580, 15'h4595, 15'h45AA, 15'h45BF,
 15'h45D4, 15'h45E9, 15'h45FE, 15'h4613, 15'h4628, 15'h463D, 15'h4652, 15'h4667, 15'h467C, 15'h4691, 15'h46A6, 15'h46BB, 15'h46D0, 15'h46E5, 15'h46FA, 15'h470F,
 15'h4724, 15'h4739, 15'h474D, 15'h4762, 15'h4777, 15'h478C, 15'h47A1, 15'h47B6, 15'h47CB, 15'h47DF, 15'h47F4, 15'h4809, 15'h481E, 15'h4833, 15'h4847, 15'h485C,
 15'h4871, 15'h4885, 15'h489A, 15'h48AF, 15'h48C4, 15'h48D8, 15'h48ED, 15'h4902, 15'h4916, 15'h492B, 15'h4940, 15'h4954, 15'h4969, 15'h497D, 15'h4992, 15'h49A6,
 15'h49BB, 15'h49D0, 15'h49E4, 15'h49F9, 15'h4A0D, 15'h4A22, 15'h4A36, 15'h4A4B, 15'h4A5F, 15'h4A74, 15'h4A88, 15'h4A9C, 15'h4AB1, 15'h4AC5, 15'h4ADA, 15'h4AEE,
 15'h4B02, 15'h4B17, 15'h4B2B, 15'h4B40, 15'h4B54, 15'h4B68, 15'h4B7C, 15'h4B91, 15'h4BA5, 15'h4BB9, 15'h4BCE, 15'h4BE2, 15'h4BF6, 15'h4C0A, 15'h4C1F, 15'h4C33,
 15'h4C47, 15'h4C5B, 15'h4C6F, 15'h4C84, 15'h4C98, 15'h4CAC, 15'h4CC0, 15'h4CD4, 15'h4CE8, 15'h4CFC, 15'h4D10, 15'h4D24, 15'h4D38, 15'h4D4C, 15'h4D61, 15'h4D75,
 15'h4D89, 15'h4D9D, 15'h4DB1, 15'h4DC5, 15'h4DD8, 15'h4DEC, 15'h4E00, 15'h4E14, 15'h4E28, 15'h4E3C, 15'h4E50, 15'h4E64, 15'h4E78, 15'h4E8C, 15'h4E9F, 15'h4EB3,
 15'h4EC7, 15'h4EDB, 15'h4EEF, 15'h4F03, 15'h4F16, 15'h4F2A, 15'h4F3E, 15'h4F52, 15'h4F65, 15'h4F79, 15'h4F8D, 15'h4FA0, 15'h4FB4, 15'h4FC8, 15'h4FDB, 15'h4FEF,
 15'h5003, 15'h5016, 15'h502A, 15'h503E, 15'h5051, 15'h5065, 15'h5078, 15'h508C, 15'h509F, 15'h50B3, 15'h50C6, 15'h50DA, 15'h50ED, 15'h5101, 15'h5114, 15'h5128,
 15'h513B, 15'h514F, 15'h5162, 15'h5175, 15'h5189, 15'h519C, 15'h51B0, 15'h51C3, 15'h51D6, 15'h51EA, 15'h51FD, 15'h5210, 15'h5223, 15'h5237, 15'h524A, 15'h525D,
 15'h5270, 15'h5284, 15'h5297, 15'h52AA, 15'h52BD, 15'h52D1, 15'h52E4, 15'h52F7, 15'h530A, 15'h531D, 15'h5330, 15'h5343, 15'h5356, 15'h5369, 15'h537D, 15'h5390,
 15'h53A3, 15'h53B6, 15'h53C9, 15'h53DC, 15'h53EF, 15'h5402, 15'h5415, 15'h5428, 15'h543B, 15'h544D, 15'h5460, 15'h5473, 15'h5486, 15'h5499, 15'h54AC, 15'h54BF,
 15'h54D2, 15'h54E4, 15'h54F7, 15'h550A, 15'h551D, 15'h5530, 15'h5542, 15'h5555, 15'h5568, 15'h557B, 15'h558D, 15'h55A0, 15'h55B3, 15'h55C5, 15'h55D8, 15'h55EB,
 15'h55FD, 15'h5610, 15'h5622, 15'h5635, 15'h5648, 15'h565A, 15'h566D, 15'h567F, 15'h5692, 15'h56A4, 15'h56B7, 15'h56C9, 15'h56DC, 15'h56EE, 15'h5701, 15'h5713,
 15'h5726, 15'h5738, 15'h574A, 15'h575D, 15'h576F, 15'h5781, 15'h5794, 15'h57A6, 15'h57B8, 15'h57CB, 15'h57DD, 15'h57EF, 15'h5802, 15'h5814, 15'h5826, 15'h5838,
 15'h584A, 15'h585D, 15'h586F, 15'h5881, 15'h5893, 15'h58A5, 15'h58B7, 15'h58CA, 15'h58DC, 15'h58EE, 15'h5900, 15'h5912, 15'h5924, 15'h5936, 15'h5948, 15'h595A,
 15'h596C, 15'h597E, 15'h5990, 15'h59A2, 15'h59B4, 15'h59C6, 15'h59D8, 15'h59EA, 15'h59FC, 15'h5A0D, 15'h5A1F, 15'h5A31, 15'h5A43, 15'h5A55, 15'h5A67, 15'h5A78,
 15'h5A8A, 15'h5A9C, 15'h5AAE, 15'h5ABF, 15'h5AD1, 15'h5AE3, 15'h5AF5, 15'h5B06, 15'h5B18, 15'h5B2A, 15'h5B3B, 15'h5B4D, 15'h5B5E, 15'h5B70, 15'h5B82, 15'h5B93,
 15'h5BA5, 15'h5BB6, 15'h5BC8, 15'h5BD9, 15'h5BEB, 15'h5BFC, 15'h5C0E, 15'h5C1F, 15'h5C31, 15'h5C42, 15'h5C54, 15'h5C65, 15'h5C76, 15'h5C88, 15'h5C99, 15'h5CAB,
 15'h5CBC, 15'h5CCD, 15'h5CDE, 15'h5CF0, 15'h5D01, 15'h5D12, 15'h5D24, 15'h5D35, 15'h5D46, 15'h5D57, 15'h5D68, 15'h5D7A, 15'h5D8B, 15'h5D9C, 15'h5DAD, 15'h5DBE,
 15'h5DCF, 15'h5DE0, 15'h5DF2, 15'h5E03, 15'h5E14, 15'h5E25, 15'h5E36, 15'h5E47, 15'h5E58, 15'h5E69, 15'h5E7A, 15'h5E8B, 15'h5E9C, 15'h5EAD, 15'h5EBD, 15'h5ECE,
 15'h5EDF, 15'h5EF0, 15'h5F01, 15'h5F12, 15'h5F23, 15'h5F33, 15'h5F44, 15'h5F55, 15'h5F66, 15'h5F77, 15'h5F87, 15'h5F98, 15'h5FA9, 15'h5FB9, 15'h5FCA, 15'h5FDB,
 15'h5FEB, 15'h5FFC, 15'h600D, 15'h601D, 15'h602E, 15'h603E, 15'h604F, 15'h6060, 15'h6070, 15'h6081, 15'h6091, 15'h60A2, 15'h60B2, 15'h60C3, 15'h60D3, 15'h60E4,
 15'h60F4, 15'h6104, 15'h6115, 15'h6125, 15'h6135, 15'h6146, 15'h6156, 15'h6166, 15'h6177, 15'h6187, 15'h6197, 15'h61A8, 15'h61B8, 15'h61C8, 15'h61D8, 15'h61E9,
 15'h61F9, 15'h6209, 15'h6219, 15'h6229, 15'h6239, 15'h6249, 15'h625A, 15'h626A, 15'h627A, 15'h628A, 15'h629A, 15'h62AA, 15'h62BA, 15'h62CA, 15'h62DA, 15'h62EA,
 15'h62FA, 15'h630A, 15'h631A, 15'h6329, 15'h6339, 15'h6349, 15'h6359, 15'h6369, 15'h6379, 15'h6389, 15'h6398, 15'h63A8, 15'h63B8, 15'h63C8, 15'h63D7, 15'h63E7,
 15'h63F7, 15'h6407, 15'h6416, 15'h6426, 15'h6436, 15'h6445, 15'h6455, 15'h6464, 15'h6474, 15'h6484, 15'h6493, 15'h64A3, 15'h64B2, 15'h64C2, 15'h64D1, 15'h64E1,
 15'h64F0, 15'h6500, 15'h650F, 15'h651F, 15'h652E, 15'h653D, 15'h654D, 15'h655C, 15'h656B, 15'h657B, 15'h658A, 15'h6599, 15'h65A9, 15'h65B8, 15'h65C7, 15'h65D6,
 15'h65E6, 15'h65F5, 15'h6604, 15'h6613, 15'h6622, 15'h6631, 15'h6641, 15'h6650, 15'h665F, 15'h666E, 15'h667D, 15'h668C, 15'h669B, 15'h66AA, 15'h66B9, 15'h66C8,
 15'h66D7, 15'h66E6, 15'h66F5, 15'h6704, 15'h6713, 15'h6722, 15'h6731, 15'h673F, 15'h674E, 15'h675D, 15'h676C, 15'h677B, 15'h678A, 15'h6798, 15'h67A7, 15'h67B6,
 15'h67C5, 15'h67D3, 15'h67E2, 15'h67F1, 15'h67FF, 15'h680E, 15'h681D, 15'h682B, 15'h683A, 15'h6848, 15'h6857, 15'h6866, 15'h6874, 15'h6883, 15'h6891, 15'h68A0,
 15'h68AE, 15'h68BD, 15'h68CB, 15'h68D9, 15'h68E8, 15'h68F6, 15'h6905, 15'h6913, 15'h6921, 15'h6930, 15'h693E, 15'h694C, 15'h695B, 15'h6969, 15'h6977, 15'h6985,
 15'h6994, 15'h69A2, 15'h69B0, 15'h69BE, 15'h69CC, 15'h69DA, 15'h69E9, 15'h69F7, 15'h6A05, 15'h6A13, 15'h6A21, 15'h6A2F, 15'h6A3D, 15'h6A4B, 15'h6A59, 15'h6A67,
 15'h6A75, 15'h6A83, 15'h6A91, 15'h6A9F, 15'h6AAD, 15'h6ABB, 15'h6AC8, 15'h6AD6, 15'h6AE4, 15'h6AF2, 15'h6B00, 15'h6B0E, 15'h6B1B, 15'h6B29, 15'h6B37, 15'h6B45,
 15'h6B52, 15'h6B60, 15'h6B6E, 15'h6B7B, 15'h6B89, 15'h6B97, 15'h6BA4, 15'h6BB2, 15'h6BBF, 15'h6BCD, 15'h6BDA, 15'h6BE8, 15'h6BF6, 15'h6C03, 15'h6C11, 15'h6C1E,
 15'h6C2B, 15'h6C39, 15'h6C46, 15'h6C54, 15'h6C61, 15'h6C6E, 15'h6C7C, 15'h6C89, 15'h6C96, 15'h6CA4, 15'h6CB1, 15'h6CBE, 15'h6CCC, 15'h6CD9, 15'h6CE6, 15'h6CF3,
 15'h6D00, 15'h6D0E, 15'h6D1B, 15'h6D28, 15'h6D35, 15'h6D42, 15'h6D4F, 15'h6D5C, 15'h6D69, 15'h6D76, 15'h6D83, 15'h6D90, 15'h6D9D, 15'h6DAA, 15'h6DB7, 15'h6DC4,
 15'h6DD1, 15'h6DDE, 15'h6DEB, 15'h6DF8, 15'h6E05, 15'h6E12, 15'h6E1E, 15'h6E2B, 15'h6E38, 15'h6E45, 15'h6E52, 15'h6E5E, 15'h6E6B, 15'h6E78, 15'h6E84, 15'h6E91,
 15'h6E9E, 15'h6EAA, 15'h6EB7, 15'h6EC4, 15'h6ED0, 15'h6EDD, 15'h6EE9, 15'h6EF6, 15'h6F02, 15'h6F0F, 15'h6F1B, 15'h6F28, 15'h6F34, 15'h6F41, 15'h6F4D, 15'h6F5A,
 15'h6F66, 15'h6F72, 15'h6F7F, 15'h6F8B, 15'h6F97, 15'h6FA4, 15'h6FB0, 15'h6FBC, 15'h6FC8, 15'h6FD5, 15'h6FE1, 15'h6FED, 15'h6FF9, 15'h7006, 15'h7012, 15'h701E,
 15'h702A, 15'h7036, 15'h7042, 15'h704E, 15'h705A, 15'h7066, 15'h7072, 15'h707E, 15'h708A, 15'h7096, 15'h70A2, 15'h70AE, 15'h70BA, 15'h70C6, 15'h70D2, 15'h70DE,
 15'h70EA, 15'h70F5, 15'h7101, 15'h710D, 15'h7119, 15'h7125, 15'h7130, 15'h713C, 15'h7148, 15'h7153, 15'h715F, 15'h716B, 15'h7176, 15'h7182, 15'h718E, 15'h7199,
 15'h71A5, 15'h71B0, 15'h71BC, 15'h71C7, 15'h71D3, 15'h71DE, 15'h71EA, 15'h71F5, 15'h7201, 15'h720C, 15'h7218, 15'h7223, 15'h722E, 15'h723A, 15'h7245, 15'h7250,
 15'h725C, 15'h7267, 15'h7272, 15'h727E, 15'h7289, 15'h7294, 15'h729F, 15'h72AA, 15'h72B6, 15'h72C1, 15'h72CC, 15'h72D7, 15'h72E2, 15'h72ED, 15'h72F8, 15'h7303,
 15'h730E, 15'h7319, 15'h7324, 15'h732F, 15'h733A, 15'h7345, 15'h7350, 15'h735B, 15'h7366, 15'h7371, 15'h737B, 15'h7386, 15'h7391, 15'h739C, 15'h73A7, 15'h73B1,
 15'h73BC, 15'h73C7, 15'h73D2, 15'h73DC, 15'h73E7, 15'h73F2, 15'h73FC, 15'h7407, 15'h7412, 15'h741C, 15'h7427, 15'h7431, 15'h743C, 15'h7446, 15'h7451, 15'h745B,
 15'h7466, 15'h7470, 15'h747B, 15'h7485, 15'h7490, 15'h749A, 15'h74A4, 15'h74AF, 15'h74B9, 15'h74C3, 15'h74CE, 15'h74D8, 15'h74E2, 15'h74EC, 15'h74F7, 15'h7501,
 15'h750B, 15'h7515, 15'h751F, 15'h7529, 15'h7533, 15'h753E, 15'h7548, 15'h7552, 15'h755C, 15'h7566, 15'h7570, 15'h757A, 15'h7584, 15'h758E, 15'h7598, 15'h75A2,
 15'h75AB, 15'h75B5, 15'h75BF, 15'h75C9, 15'h75D3, 15'h75DD, 15'h75E6, 15'h75F0, 15'h75FA, 15'h7604, 15'h760D, 15'h7617, 15'h7621, 15'h762B, 15'h7634, 15'h763E,
 15'h7647, 15'h7651, 15'h765B, 15'h7664, 15'h766E, 15'h7677, 15'h7681, 15'h768A, 15'h7694, 15'h769D, 15'h76A7, 15'h76B0, 15'h76B9, 15'h76C3, 15'h76CC, 15'h76D6,
 15'h76DF, 15'h76E8, 15'h76F2, 15'h76FB, 15'h7704, 15'h770D, 15'h7717, 15'h7720, 15'h7729, 15'h7732, 15'h773B, 15'h7744, 15'h774E, 15'h7757, 15'h7760, 15'h7769,
 15'h7772, 15'h777B, 15'h7784, 15'h778D, 15'h7796, 15'h779F, 15'h77A8, 15'h77B1, 15'h77BA, 15'h77C2, 15'h77CB, 15'h77D4, 15'h77DD, 15'h77E6, 15'h77EF, 15'h77F7,
 15'h7800, 15'h7809, 15'h7812, 15'h781A, 15'h7823, 15'h782C, 15'h7834, 15'h783D, 15'h7845, 15'h784E, 15'h7857, 15'h785F, 15'h7868, 15'h7870, 15'h7879, 15'h7881,
 15'h788A, 15'h7892, 15'h789B, 15'h78A3, 15'h78AB, 15'h78B4, 15'h78BC, 15'h78C4, 15'h78CD, 15'h78D5, 15'h78DD, 15'h78E6, 15'h78EE, 15'h78F6, 15'h78FE, 15'h7906,
 15'h790F, 15'h7917, 15'h791F, 15'h7927, 15'h792F, 15'h7937, 15'h793F, 15'h7947, 15'h794F, 15'h7957, 15'h795F, 15'h7967, 15'h796F, 15'h7977, 15'h797F, 15'h7987,
 15'h798F, 15'h7997, 15'h799F, 15'h79A7, 15'h79AE, 15'h79B6, 15'h79BE, 15'h79C6, 15'h79CD, 15'h79D5, 15'h79DD, 15'h79E4, 15'h79EC, 15'h79F4, 15'h79FB, 15'h7A03,
 15'h7A0B, 15'h7A12, 15'h7A1A, 15'h7A21, 15'h7A29, 15'h7A30, 15'h7A38, 15'h7A3F, 15'h7A47, 15'h7A4E, 15'h7A55, 15'h7A5D, 15'h7A64, 15'h7A6C, 15'h7A73, 15'h7A7A,
 15'h7A81, 15'h7A89, 15'h7A90, 15'h7A97, 15'h7A9E, 15'h7AA6, 15'h7AAD, 15'h7AB4, 15'h7ABB, 15'h7AC2, 15'h7AC9, 15'h7AD0, 15'h7AD8, 15'h7ADF, 15'h7AE6, 15'h7AED,
 15'h7AF4, 15'h7AFB, 15'h7B02, 15'h7B09, 15'h7B0F, 15'h7B16, 15'h7B1D, 15'h7B24, 15'h7B2B, 15'h7B32, 15'h7B39, 15'h7B3F, 15'h7B46, 15'h7B4D, 15'h7B54, 15'h7B5A,
 15'h7B61, 15'h7B68, 15'h7B6E, 15'h7B75, 15'h7B7C, 15'h7B82, 15'h7B89, 15'h7B8F, 15'h7B96, 15'h7B9D, 15'h7BA3, 15'h7BAA, 15'h7BB0, 15'h7BB7, 15'h7BBD, 15'h7BC3,
 15'h7BCA, 15'h7BD0, 15'h7BD7, 15'h7BDD, 15'h7BE3, 15'h7BE9, 15'h7BF0, 15'h7BF6, 15'h7BFC, 15'h7C03, 15'h7C09, 15'h7C0F, 15'h7C15, 15'h7C1B, 15'h7C21, 15'h7C28,
 15'h7C2E, 15'h7C34, 15'h7C3A, 15'h7C40, 15'h7C46, 15'h7C4C, 15'h7C52, 15'h7C58, 15'h7C5E, 15'h7C64, 15'h7C6A, 15'h7C70, 15'h7C75, 15'h7C7B, 15'h7C81, 15'h7C87,
 15'h7C8D, 15'h7C93, 15'h7C98, 15'h7C9E, 15'h7CA4, 15'h7CA9, 15'h7CAF, 15'h7CB5, 15'h7CBB, 15'h7CC0, 15'h7CC6, 15'h7CCB, 15'h7CD1, 15'h7CD6, 15'h7CDC, 15'h7CE2,
 15'h7CE7, 15'h7CED, 15'h7CF2, 15'h7CF7, 15'h7CFD, 15'h7D02, 15'h7D08, 15'h7D0D, 15'h7D12, 15'h7D18, 15'h7D1D, 15'h7D22, 15'h7D28, 15'h7D2D, 15'h7D32, 15'h7D37,
 15'h7D3D, 15'h7D42, 15'h7D47, 15'h7D4C, 15'h7D51, 15'h7D56, 15'h7D5B, 15'h7D60, 15'h7D65, 15'h7D6A, 15'h7D70, 15'h7D74, 15'h7D79, 15'h7D7E, 15'h7D83, 15'h7D88,
 15'h7D8D, 15'h7D92, 15'h7D97, 15'h7D9C, 15'h7DA1, 15'h7DA5, 15'h7DAA, 15'h7DAF, 15'h7DB4, 15'h7DB8, 15'h7DBD, 15'h7DC2, 15'h7DC6, 15'h7DCB, 15'h7DD0, 15'h7DD4,
 15'h7DD9, 15'h7DDE, 15'h7DE2, 15'h7DE7, 15'h7DEB, 15'h7DF0, 15'h7DF4, 15'h7DF9, 15'h7DFD, 15'h7E01, 15'h7E06, 15'h7E0A, 15'h7E0F, 15'h7E13, 15'h7E17, 15'h7E1C,
 15'h7E20, 15'h7E24, 15'h7E28, 15'h7E2D, 15'h7E31, 15'h7E35, 15'h7E39, 15'h7E3D, 15'h7E42, 15'h7E46, 15'h7E4A, 15'h7E4E, 15'h7E52, 15'h7E56, 15'h7E5A, 15'h7E5E,
 15'h7E62, 15'h7E66, 15'h7E6A, 15'h7E6E, 15'h7E72, 15'h7E76, 15'h7E7A, 15'h7E7D, 15'h7E81, 15'h7E85, 15'h7E89, 15'h7E8D, 15'h7E90, 15'h7E94, 15'h7E98, 15'h7E9C,
 15'h7E9F, 15'h7EA3, 15'h7EA6, 15'h7EAA, 15'h7EAE, 15'h7EB1, 15'h7EB5, 15'h7EB8, 15'h7EBC, 15'h7EBF, 15'h7EC3, 15'h7EC6, 15'h7ECA, 15'h7ECD, 15'h7ED1, 15'h7ED4,
 15'h7ED7, 15'h7EDB, 15'h7EDE, 15'h7EE2, 15'h7EE5, 15'h7EE8, 15'h7EEB, 15'h7EEF, 15'h7EF2, 15'h7EF5, 15'h7EF8, 15'h7EFB, 15'h7EFF, 15'h7F02, 15'h7F05, 15'h7F08,
 15'h7F0B, 15'h7F0E, 15'h7F11, 15'h7F14, 15'h7F17, 15'h7F1A, 15'h7F1D, 15'h7F20, 15'h7F23, 15'h7F26, 15'h7F29, 15'h7F2B, 15'h7F2E, 15'h7F31, 15'h7F34, 15'h7F37,
 15'h7F39, 15'h7F3C, 15'h7F3F, 15'h7F42, 15'h7F44, 15'h7F47, 15'h7F4A, 15'h7F4C, 15'h7F4F, 15'h7F51, 15'h7F54, 15'h7F57, 15'h7F59, 15'h7F5C, 15'h7F5E, 15'h7F61,
 15'h7F63, 15'h7F65, 15'h7F68, 15'h7F6A, 15'h7F6D, 15'h7F6F, 15'h7F71, 15'h7F74, 15'h7F76, 15'h7F78, 15'h7F7B, 15'h7F7D, 15'h7F7F, 15'h7F81, 15'h7F83, 15'h7F86,
 15'h7F88, 15'h7F8A, 15'h7F8C, 15'h7F8E, 15'h7F90, 15'h7F92, 15'h7F94, 15'h7F96, 15'h7F98, 15'h7F9A, 15'h7F9C, 15'h7F9E, 15'h7FA0, 15'h7FA2, 15'h7FA4, 15'h7FA6,
 15'h7FA7, 15'h7FA9, 15'h7FAB, 15'h7FAD, 15'h7FAF, 15'h7FB0, 15'h7FB2, 15'h7FB4, 15'h7FB6, 15'h7FB7, 15'h7FB9, 15'h7FBA, 15'h7FBC, 15'h7FBE, 15'h7FBF, 15'h7FC1,
 15'h7FC2, 15'h7FC4, 15'h7FC5, 15'h7FC7, 15'h7FC8, 15'h7FCA, 15'h7FCB, 15'h7FCD, 15'h7FCE, 15'h7FCF, 15'h7FD1, 15'h7FD2, 15'h7FD3, 15'h7FD4, 15'h7FD6, 15'h7FD7,
 15'h7FD8, 15'h7FD9, 15'h7FDB, 15'h7FDC, 15'h7FDD, 15'h7FDE, 15'h7FDF, 15'h7FE0, 15'h7FE1, 15'h7FE2, 15'h7FE3, 15'h7FE4, 15'h7FE5, 15'h7FE6, 15'h7FE7, 15'h7FE8,
 15'h7FE9, 15'h7FEA, 15'h7FEB, 15'h7FEC, 15'h7FED, 15'h7FED, 15'h7FEE, 15'h7FEF, 15'h7FF0, 15'h7FF1, 15'h7FF1, 15'h7FF2, 15'h7FF3, 15'h7FF3, 15'h7FF4, 15'h7FF5,
 15'h7FF5, 15'h7FF6, 15'h7FF6, 15'h7FF7, 15'h7FF7, 15'h7FF8, 15'h7FF8, 15'h7FF9, 15'h7FF9, 15'h7FFA, 15'h7FFA, 15'h7FFB, 15'h7FFB, 15'h7FFB, 15'h7FFC, 15'h7FFC,
 15'h7FFC, 15'h7FFD, 15'h7FFD, 15'h7FFD, 15'h7FFD, 15'h7FFE, 15'h7FFE, 15'h7FFE, 15'h7FFE, 15'h7FFE, 15'h7FFE, 15'h7FFE, 15'h7FFE, 15'h7FFE, 15'h7FFE, 15'h7FFF
};

endmodule
