//==========================================================
//  Title     : SONY Mobile CIS
//  Comment   : DUBE block
//  Project   : 
//
//  File Name : 
//
//
//  CONFIDENTIAL AND PROPRIETARY PRODUCT OF SONY CORPORATION
//  Copyright (c) 2015 Sony Corporation.  All Rights Reserved.
//
//  Reference File Name     : (Generated by Excel)
//  Reference File Revision : (none)
//  Reference File Project  : 
//==========================================================



module                  SCL_BUSY(
     VTCLK
    ,XRST
    ,SCL_COBLK_OBLK_H
    ,SCL_COBLK_OBLK_V
    ,SCL_SEL4BLK_LU_H
    ,SCL_SEL4BLK_LU_V
    ,SCL_CIBLK_IBLK_H
    ,SCL_CIBLK_IBLK_V
    ,RG_SCL_OUTPUT_WIDTH
    ,RG_SCL_OUTPUT_HEIGHT
    ,SCL_SEL4BLK_EXCEP_H
    ,SCL_SEL4BLK_EXCEP_V
    ,IDATA_EN
    ,SCL_BUSY_BUSY
    ,ODATA_EN
);


/*************************************************
INPUT , OUTPUT
*************************************************/
input           VTCLK;                          // 
input           XRST;                           // 
input   [9:0]   SCL_COBLK_OBLK_H;               // 
input   [9:0]   SCL_COBLK_OBLK_V;               // 
input   [9:0]   SCL_SEL4BLK_LU_H;               // 
input   [9:0]   SCL_SEL4BLK_LU_V;               // 
input   [9:0]   SCL_CIBLK_IBLK_H;               // 
input   [9:0]   SCL_CIBLK_IBLK_V;               // 
input   [10:0]  RG_SCL_OUTPUT_WIDTH;            // 
input   [10:0]  RG_SCL_OUTPUT_HEIGHT;           // 
input           SCL_SEL4BLK_EXCEP_H;            // 
input           SCL_SEL4BLK_EXCEP_V;            // 
input           IDATA_EN;                       // 
output          SCL_BUSY_BUSY;                  // 
output          ODATA_EN;                       // 

/*************************************************
reg, wire
*************************************************/
//reg SCL_BUSY_BUSY;
//reg ODATA_EN;
wire flg1;
wire flg2;
wire excep_h_flg;
wire excep_v_flg;
wire flg3;
wire flg4;

assign flg1 = (SCL_COBLK_OBLK_H < 3);
assign flg2 = ((SCL_SEL4BLK_LU_H == ((SCL_CIBLK_IBLK_H - 4'd8))) & ((SCL_SEL4BLK_LU_V + 1) == SCL_CIBLK_IBLK_V));
assign excep_h_flg = (SCL_SEL4BLK_EXCEP_H & ((RG_SCL_OUTPUT_WIDTH >> 1) > SCL_COBLK_OBLK_H));
assign excep_v_flg = (SCL_SEL4BLK_EXCEP_V & ((RG_SCL_OUTPUT_WIDTH >> 1) > SCL_COBLK_OBLK_H)) & ((RG_SCL_OUTPUT_HEIGHT >> 1) > SCL_COBLK_OBLK_V);
assign flg3 = (flg2 | excep_h_flg | (excep_v_flg & (SCL_SEL4BLK_LU_H - 4'd8) == SCL_CIBLK_IBLK_H));
//assign flg4 = ~(flg1 ^ flg3);
assign SCL_BUSY_BUSY = ~(flg1 ^ flg3);
assign ODATA_EN = flg3;

/*
always @(posedge VTCLK or negedge XRST) begin
  if (XRST == 1'b0) begin
    SCL_BUSY_BUSY <= 1;
    ODATA_EN <= 0;
  end else begin
    SCL_BUSY_BUSY <= flg4;
    ODATA_EN <= flg3;
  end
end
*/

endmodule
