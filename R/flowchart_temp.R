library(DiagrammeR)

grViz(
  "digraph my_flowchart { 
      graph[splines = ortho]
      node [fontname = Helvetica, shape = box, width = 4, height = 1]
      
        node1[label = <Primary knee replacements in the<br/>2020 NJR Annual Report<br/>(n = incl1)>]
        node2[label = <Eligible primaries (n = incl2)>]
        
        blank1[label = '', width = 0.01, height = 0.01]
        excluded1[label = <Excluded<br/>(1) Not consented for research purposes (n=excl1_a) <br/>(2) Privately funded (n=excl1_b) <br/>(3) Primary before YYYYMMDD or after YYYYMMDD (n=excl1_c) <br/> Total n = excl1>]
        
        node1 -> blank1[dir = none];
        blank1 -> excluded1[minlen = 2];
        blank1 -> node2;
        { rank = same; blank1 excluded1 }
 
        blank2[label = '', width = 0.01, height = 0.01]
        excluded2[label = <Excluded <br/>(1) No HES linkage <br/>(n = excl2_a)>]
        
        node3[label = <Total knee primaries with Q1 and Q2 PROMs data<br/>N = Total>]
        
        node2 -> blank2[dir = none];
        
        blank2 -> excluded2[minlen = 2];
        
        blank2 -> node3;
        
        { rank = same; blank2 excluded2 }
     }"
)