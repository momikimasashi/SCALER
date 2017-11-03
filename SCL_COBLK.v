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



module                  SCL_COBLK(
     VTCLK
    ,XRST
    ,RG_SCL_OUTPUT_WIDTH
    ,RG_SCL_OUTPUT_HEIGHT
    ,IHSYNC
    ,IVSYNC
    ,SCL_BUSY_BUSY
    ,SCL_COBLK_OBLK_H
    ,SCL_COBLK_OBLK_V
);


/*************************************************
INPUT , OUTPUT
*************************************************/
input           VTCLK;                          // 
input           XRST;                           // 
input   [10:0]  RG_SCL_OUTPUT_WIDTH;            // 
input   [10:0]  RG_SCL_OUTPUT_HEIGHT;           // 
input           IHSYNC;                         // 
input           IVSYNC;                         // 
input           SCL_BUSY_BUSY;                  // 
output  [9:0]   SCL_COBLK_OBLK_H;               // 
output  [9:0]   SCL_COBLK_OBLK_V;               // 

/*************************************************
reg, wire
*************************************************/
reg [9:0] SCL_COBLK_OBLK_H;
reg [9:0] SCL_COBLK_OBLK_V;
wire SCL_COBLK_OBLK_H_EN;
wire SCL_COBLK_OBLK_V_EN;

assign SCL_COBLK_OBLK_H_EN = ~(SCL_COBLK_OBLK_H == (RG_SCL_OUTPUT_WIDTH >> 1)) & ~SCL_BUSY_BUSY;
assign SCL_COBLK_OBLK_V_EN = (SCL_COBLK_OBLK_H == (RG_SCL_OUTPUT_WIDTH >> 1));

always @(posedge VTCLK or negedge XRST) begin
  if (XRST == 1'b0) begin
    SCL_COBLK_OBLK_H <= 1'b0;
    SCL_COBLK_OBLK_V <= 1'b0;
  end else begin
    if (IHSYNC == 1'b1) begin
      SCL_COBLK_OBLK_H <= 1'b0;
    end else if (SCL_COBLK_OBLK_H_EN == 1) begin
      SCL_COBLK_OBLK_H <= SCL_COBLK_OBLK_H + 1'b1;
    end else begin
      SCL_COBLK_OBLK_H <= SCL_COBLK_OBLK_H;
    end

    if (IVSYNC == 1) begin
      SCL_COBLK_OBLK_V <= 1'b0;
    end else if (SCL_COBLK_OBLK_V_EN & IHSYNC) begin
      SCL_COBLK_OBLK_V <= SCL_COBLK_OBLK_V + 1'b1;
    end else begin
      SCL_COBLK_OBLK_V <= SCL_COBLK_OBLK_V;
    end
  end
end
endmodule
