function [predict_label_kernel dec_values_kernel]=head_tail_analyze(image,modeltype,cHTParameters)

        max_image=double(image);
        averageint=mean2(max_image);
        
        if averageint>200 
            predict_label_kernel=1 %head
        else
            predict_label_kernel=2 %tail
        end
        
    end



