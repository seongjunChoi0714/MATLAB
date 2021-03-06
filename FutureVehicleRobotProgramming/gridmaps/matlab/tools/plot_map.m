function plot_map(map, mapBox, robPoseMapFrame, poses, laserEndPntsMapFrame, gridSize, offset, t)
	
	close all
%	figure 
	%graphics_toolkit gnuplot	
	%f = figure( "visible", "off");
	%axis(mapBox);
	%hold on;
	map = map';
    
    figure;
    set(gcf, "visible","off");
    axis(mapBox);
	imshow(ones(size(map)) - log_odds_to_prob(map));
    hold on;
    
	s = size(map); 
    s = s(1:2);
    
    set(gcf, "position", [50 50 s*5]); 
    set(gca, "position", [.05 .05 .9 .9]);
    
	traj = [poses(1:t,1)';poses(1:t,2)'];
	traj = world_to_map_coordinates(traj, gridSize, offset);
	plot(traj(1,:),traj(2,:),'g','linewidth',2);
	plot(robPoseMapFrame(1),robPoseMapFrame(2),'bo','markersize',6,'linewidth',4);
	plot(laserEndPntsMapFrame(1,:),laserEndPntsMapFrame(2,:),'ro','markersize',2, 'linewidth',2);
    filename = sprintf('../plots/gridmap_%03d.png', t);
	print(gcf, filename, '-dpng');
	close all;

end
