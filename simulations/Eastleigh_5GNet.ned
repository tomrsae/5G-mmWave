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

import ned.IdealChannel;
import simu5g.nodes.NR.gNodeB;
import simu5g.nodes.Upf;
import simu5g.nodes.backgroundCell.BackgroundCell;
import inet.node.ethernet.Eth10G;

network Eastleigh_5GNet
{
    @display("bgi=background/eastleigh,c;bgb=700,700;bgu=m");
    submodules:
        gnb0: gNodeB {
            @display("p=98.02,106.46999;r=150");
        }
        gnb1: gNodeB {
            @display("p=343.06998,106.46999;r=150");
        }
        gnb2: gNodeB {
            @display("p=588.12,106.46999;r=150");
        }
        gnb3: gNodeB {
            @display("p=98.02,354.9;r=150");
        }
        gnb4: gNodeB {
            @display("p=343.06998,354.9;r=150");
        }
        gnb5: gNodeB {
            @display("p=588.12,354.9;r=150");
        }
        gnb6: gNodeB {
            @display("p=98.02,605.01996;r=150");
        }
        gnb7: gNodeB {
            @display("p=343.06998,605.01996;r=150");
        }
        gnb8: gNodeB {
            @display("p=588.12,605.01996;r=150");
        }
        upf: Upf {
            @display("p=456.3,312.65");
        }
        bgCell: BackgroundCell {
            @display("p=231.53,603.32996;is=l");
        }
    connections:
        // BS -> 5GC (ppp)
        upf.pppg++ <--> Eth10G <--> gnb0.ppp;
        upf.pppg++ <--> Eth10G <--> gnb1.ppp;
        upf.pppg++ <--> Eth10G <--> gnb2.ppp;
        upf.pppg++ <--> Eth10G <--> gnb3.ppp;
        upf.pppg++ <--> Eth10G <--> gnb4.ppp;
        upf.pppg++ <--> Eth10G <--> gnb5.ppp;
        upf.pppg++ <--> Eth10G <--> gnb6.ppp;
        upf.pppg++ <--> Eth10G <--> gnb7.ppp;
        upf.pppg++ <--> Eth10G <--> gnb8.ppp;
        
        // BS -> BS (Xn)
        
}
