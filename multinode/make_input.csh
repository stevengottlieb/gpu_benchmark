#!/bin/csh
set nodes = $1
if ($nodes ==  1 ) then
   set node_geom = " 1 1 2 3 "
   set io_geom = " 1 1 1 1 "
   set nx =  32
   set ny =  32
   set nz =  64
   set nt =  96
else if ($nodes ==  2 ) then
   set node_geom = " 1 2 2 3 "
   set io_geom = " 1 2 1 1 "
   set nx =  32
   set ny =  64
   set nz =  64
   set nt =  96
else if ($nodes ==  4 ) then
   set node_geom = " 2 2 2 3 "
   set io_geom = " 2 2 1 1 "
   set nx =  64
   set ny =  64
   set nz =  64
   set nt =  96
else if ($nodes ==  8 ) then
   set node_geom = " 2 2 2 6 "
   set io_geom = " 2 2 1 2 "
   set nx =  64
   set ny =  64
   set nz =  64
   set nt =  192
else if ($nodes ==  16 ) then
   set node_geom = " 2 2 4 6 "
   set io_geom = " 2 2 2 2 "
   set nx =  64
   set ny =  64
   set nz =  128
   set nt =  192
else if ($nodes ==  32 ) then
   set node_geom = " 2 4 4 6 "
   set io_geom = " 2 4 2 2 "
   set nx =  64
   set ny =  128
   set nz =  128
   set nt =  192
else if ($nodes ==  64 ) then
   set node_geom = " 4 4 4 6 "
   set io_geom = " 4 4 2 2 "
   set nx =  128
   set ny =  128
   set nz =  128
   set nt =  192
else if ($nodes ==  128 ) then
   set node_geom = " 4 4 4 12 "
   set io_geom = " 4 4 2 4 "
   set nx =  128
   set ny =  128
   set nz =  128
   set nt =  384
else if ($nodes ==  256 ) then
   set node_geom = " 4 4 8 12 "
   set io_geom = " 4 4 4 4 "
   set nx =  128
   set ny =  128
   set nz =  256
   set nt =  384
else if ($nodes ==  512 ) then
   set node_geom = " 4 8 8 12 "
   set io_geom = " 4 8 4 4 "
   set nx =  128
   set ny =  256
   set nz =  256
   set nt =  384
else if ($nodes ==  1024 ) then
   set node_geom = " 8 8 8 12 "
   set io_geom = " 8 8 4 4 "
   set nx =  256
   set ny =  256
   set nz =  256
   set nt =  384
else
   echo "don't know how to deal with $nodes nodes"
   exit
endif
rm -f input.$nodes input.${nodes}.tune
sed -e "s/NODEGEOM/${node_geom}/" -e "s/IOGEOM/${io_geom}/" -e "s/NX/${nx}/" -e "s/NY/${ny}/" -e "s/NZ/${nz}/" -e "s/NT/${nt}/" <INPUT.tune >input.$nodes.tune
sed -e "s/NODEGEOM/${node_geom}/" -e "s/IOGEOM/${io_geom}/" -e "s/NX/${nx}/" -e "s/NY/${ny}/" -e "s/NZ/${nz}/" -e "s/NT/${nt}/" <INPUT >input.${nodes}
