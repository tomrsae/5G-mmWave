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

import inet.networklayer.configurator.ipv4.Ipv4NetworkConfigurator;
import ned.IdealChannel;
import simu5g.common.binder.Binder;
import simu5g.common.carrierAggregation.CarrierAggregation;
import simu5g.common.carrierAggregation.ComponentCarrier;
import simu5g.nodes.NR.NRUe;
import simu5g.nodes.NR.gNodeB;
import simu5g.nodes.Upf;
import simu5g.nodes.backgroundCell.BackgroundCell;
import inet.node.ethernet.Eth10G;
import inet.node.inet.Router;
import inet.node.inet.StandardHost;
import simu5g.world.radio.ChannelControl;
import simu5g.world.radio.LteChannelControl;
import inet.networklayer.ipv4.RoutingTableRecorder;


network Eastleigh_5GNet
{
    @display("bgi=background/eastleigh,c;bgb=700,700;bgu=m");
    submodules:
        channelControl: LteChannelControl {      // Use LteChannelControl to prevent deletion of d2d parameter from predefined class
            @display("p=173.184,46.464");
        }
        configurator: Ipv4NetworkConfigurator {
            @display("p=40.832,278.784");
        }
        binder: Binder {
            @display("p=40.832,160.51201");
        }
        carrierAggregation: CarrierAggregation {
            @display("p=40.832,47.872");
        }
        server: StandardHost {
            @display("p=230.912,229.50401");
        }
        router: Router {
            @display("p=456.19202,229.50401");
        }
        upf: Upf {
            @display("p=456.3,312.65");
        }
        gnb0: gNodeB {
            @display("p=98.02,106.46999;r=150");
        }
        gnb1: gNodeB {
            @display("p=343.06998,106.46999;r=150");
        }
//        gnb2: gNodeB {
//            @display("p=588.12,106.46999;r=150");
//        }
//        gnb3: gNodeB {
//            @display("p=98.02,354.9;r=150");
//        }
//        gnb4: gNodeB {
//            @display("p=343.06998,354.9;r=150");
//        }
//        gnb5: gNodeB {
//            @display("p=588.12,354.9;r=150");
//        }
//        gnb6: gNodeB {
//            @display("p=98.02,605.01996;r=150");
//        }
//        gnb7: gNodeB {
//            @display("p=343.06998,605.01996;r=150");
//        }
//        gnb8: gNodeB {
//            @display("p=588.12,605.01996;r=150");
//        }

        bgCell: BackgroundCell {
            @display("p=178.81601,594.176;is=l");
        }
        nrUe: NRUe {
            @display("p=342.144,367.488");
        }
//        nrUe1: NRUe {
//            @display("p=142.20801,284.41602");
//        }
//        nrUe2: NRUe {
//            @display("p=137.98401,235.136");
//        }
//        nrUe3: NRUe {
//            @display("p=489.984,133.76001");
//        }
//        nrUe4: NRUe {
//            @display("p=332.28802,473.088");
//        }


    connections:
        // Server -> 5GC (ppp)
        server.pppg++ <--> Eth10G <--> router.pppg++;
        router.pppg++ <--> Eth10G <--> upf.filterGate;


        // BS -> 5GC (ppp)
        upf.pppg++ <--> Eth10G <--> gnb0.ppp;
        upf.pppg++ <--> Eth10G <--> gnb1.ppp;
//        upf.pppg++ <--> Eth10G <--> gnb2.ppp;
//        upf.pppg++ <--> Eth10G <--> gnb3.ppp;
//        upf.pppg++ <--> Eth10G <--> gnb4.ppp;
//        upf.pppg++ <--> Eth10G <--> gnb5.ppp;
//        upf.pppg++ <--> Eth10G <--> gnb6.ppp;
//        upf.pppg++ <--> Eth10G <--> gnb7.ppp;
//        upf.pppg++ <--> Eth10G <--> gnb8.ppp;

        // BS -> BS (Xn)
        gnb0.x2++ <--> Eth10G <--> gnb1.x2++;
//        gnb0.x2++ <--> Eth10G <--> gnb3.x2++;
//        gnb0.x2++ <--> Eth10G <--> gnb4.x2++;
//        gnb1.x2++ <--> Eth10G <--> gnb2.x2++;
//        gnb1.x2++ <--> Eth10G <--> gnb4.x2++;
//        gnb1.x2++ <--> Eth10G <--> gnb3.x2++;
//        gnb1.x2++ <--> Eth10G <--> gnb5.x2++;
//        gnb2.x2++ <--> Eth10G <--> gnb5.x2++;
//        gnb2.x2++ <--> Eth10G <--> gnb4.x2++;
//        gnb3.x2++ <--> Eth10G <--> gnb4.x2++;
//        gnb3.x2++ <--> Eth10G <--> gnb6.x2++;
//        gnb3.x2++ <--> Eth10G <--> gnb7.x2++;
//        gnb4.x2++ <--> Eth10G <--> gnb5.x2++;
//        gnb4.x2++ <--> Eth10G <--> gnb7.x2++;
//        gnb4.x2++ <--> Eth10G <--> gnb6.x2++;
//        gnb4.x2++ <--> Eth10G <--> gnb8.x2++;
//        gnb5.x2++ <--> Eth10G <--> gnb8.x2++;
//        gnb5.x2++ <--> Eth10G <--> gnb7.x2++;
//        gnb6.x2++ <--> Eth10G <--> gnb7.x2++;
//        gnb7.x2++ <--> Eth10G <--> gnb8.x2++;

}
