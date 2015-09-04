function new_par = update_parameters(new_par, par, type)


detection_params = {'segments_length', 'sr','tmax','tmin','w_pre', ...
    'w_post','alignment_window', 'stdmin','stdmax', 'detect_fmin', ...
    'detect_fmax','sort_fmin','sort_fmax', 'ref_ms', 'detection', ...
    'int_factor','interpolation'};



clus_params = {'inputs','scales','features','template_sdnum', 'template_k', ...
    'template_k_min','template_type','force_feature','match', ...
    'max_spk','permut','mintemp', 'maxtemp', 'tempstep','SWCycles',...
    'KNearNeighb', 'num_temp', 'min_clus','max_clus','randomseed'};

new_par_names = fieldnames(new_par);
load_par_names = fieldnames(par);
if strcmp(type,'detect') || strcmp(type,'relevant')
    for i= 1:length(detection_params)
        if ismember(detection_params(i),load_par_names)
            field = char(detection_params(i));
            new_par.(field ) = par.(field );
        end
    end
end

if strcmp(type,'clus') || strcmp(type,'relevant')
    for i= 1:length(clus_params)
        if ismember(clus_params(i),load_par_names)
            field = char(clus_params(i));
            new_par.(field ) = par.(field );       
        end
    end
end

if strcmp(type,'none')
    for i= 1:length(new_par_names)
        if ~ (any((ismember(new_par_names(i),clus_params)) || any(ismember(new_par_names(i),detection_params)))) 
            field = char(new_par_names(i));
            if ismember(new_par_names(i),load_par_names)
                new_par.(field) = par.(field );
            else
                new_par.(field) = [];
            end
        end
    end
    
end
end