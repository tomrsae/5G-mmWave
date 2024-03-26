//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package _5g_mmwave.simulations;

import simu5g.nodes.NR.NRUe;
import simu5g.nodes.NR.gNodeB;


network Eastleigh_5GNet
{
    @display("bgi=background/eastleigh,c;bgb=700,700;bgu=m");
    submodules:
        gNodeB: gNodeB {
            @display("p=511.104,284.41602");
        }
        nrUe: NRUe {
            @display("p=439.29602,416.768");
        }
}
