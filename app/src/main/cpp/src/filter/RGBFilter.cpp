//
// Created by glumes on 2021/3/7.
//

#include "RGBFilter.h"
#include <FilterUtil.h>

int RGBFilter::createDescriptorLayout() {
    std::vector<VkDescriptorSetLayoutBinding> binding;
    binding.push_back(vks::descriptorSetLayoutBinding(
            VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,VK_SHADER_STAGE_FRAGMENT_BIT,1,1));

    binding.push_back(vks::descriptorSetLayoutBinding(
            VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER, VK_SHADER_STAGE_FRAGMENT_BIT, 0,1));

    VkDescriptorSetLayoutCreateInfo info = vks::descriptorSetLayoutCreateInfo(binding.data(), binding.size());

    CALL_VK(vkCreateDescriptorSetLayout(context.device,&info, nullptr,&pipeline.descLayout_));

    VkPipelineLayoutCreateInfo pipelineLayoutCreateInfo = vks::pipelineLayoutCreateInfo(&pipeline.descLayout_,1);

    const unsigned push_constant_range_count = 1;

    VkPushConstantRange push_constant_ranges[push_constant_range_count] = {};
    push_constant_ranges[0].stageFlags = VK_SHADER_STAGE_FRAGMENT_BIT;
    push_constant_ranges[0].offset = 0;
    push_constant_ranges[0].size = 3 * sizeof(float);

    pipelineLayoutCreateInfo.pushConstantRangeCount = 1;
    pipelineLayoutCreateInfo.pPushConstantRanges = push_constant_ranges;

    CALL_VK(vkCreatePipelineLayout(context.device,&pipelineLayoutCreateInfo, nullptr,&pipeline.layout_));

    return VK_SUCCESS;
}

int RGBFilter::createDescriptorSet() {
    std::vector<VkDescriptorPoolSize> poolSize ;
    poolSize.push_back(vks::descriptorPoolSize(VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,1));
    poolSize.push_back(vks::descriptorPoolSize(VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER,1));


    VkDescriptorPoolCreateInfo poolCreateInfo = vks::descriptorPoolCreateInfo(
            poolSize.size(), poolSize.data(), 2);

    CALL_VK(vkCreateDescriptorPool(context.device,&poolCreateInfo, nullptr,&pipeline.descPool_));

    VkDescriptorSetAllocateInfo allocateInfo = vks::descriptorSetAllocateInfo(pipeline.descPool_,&pipeline.descLayout_,1);

    CALL_VK(vkAllocateDescriptorSets(context.device,&allocateInfo,&pipeline.descSet_));
    return VK_SUCCESS;
}


int RGBFilter::updateDescriptorSet(std::vector<VkDescriptorBufferInfo> &bufferInfo,
                                   std::vector<VkDescriptorImageInfo> &imageInfo) {

    std::vector<VkWriteDescriptorSet> writeDst ;

    writeDst.push_back(vks::writeDescriptorSet(pipeline.descSet_,VK_DESCRIPTOR_TYPE_UNIFORM_BUFFER,1,bufferInfo.data(),bufferInfo.size()));

    writeDst.push_back(vks::writeDescriptorSet(pipeline.descSet_,VK_DESCRIPTOR_TYPE_COMBINED_IMAGE_SAMPLER,0,imageInfo.data(),imageInfo.size()));

    vkUpdateDescriptorSets(context.device,writeDst.size(),writeDst.data(),0, nullptr);

    return VK_SUCCESS;
}

int RGBFilter::createPipeline(VkRenderPass renderPass) {
    VkPipelineInputAssemblyStateCreateInfo inputAssemblyStateCreateInfo = vks::pipelineInputAssemblyStateCreateInfo(VK_PRIMITIVE_TOPOLOGY_TRIANGLE_LIST,0,VK_FALSE);

    VkVertexInputBindingDescription inputBindingDescription = vks::vertexInputBindingDescription(0,5 *
                                                                                                   sizeof(float),VK_VERTEX_INPUT_RATE_VERTEX);

    VkVertexInputAttributeDescription inputAttributeDescription[2] = {
            vks::vertexInputAttributeDescription(0,0,VK_FORMAT_R32G32B32_SFLOAT,0),
            vks::vertexInputAttributeDescription(0,1,VK_FORMAT_R32G32_SFLOAT,sizeof(float) * 3)};

    VkPipelineVertexInputStateCreateInfo inputStateCreateInfo = vks::pipelineVertexInputStateCreateInfo();
    inputStateCreateInfo.vertexBindingDescriptionCount = 1;
    inputStateCreateInfo.pVertexBindingDescriptions = &inputBindingDescription;
    inputStateCreateInfo.vertexAttributeDescriptionCount = 2;
    inputStateCreateInfo.pVertexAttributeDescriptions = inputAttributeDescription;

    // 绘制的方向不对也会导致渲染黑屏的
    VkPipelineRasterizationStateCreateInfo rasterizationStateCreateInfo = vks::pipelineRasterizationStateCreateInfo(
            VK_POLYGON_MODE_FILL, VK_CULL_MODE_NONE, VK_FRONT_FACE_CLOCKWISE, 0);

    VkPipelineColorBlendAttachmentState blendAttachmentState = vks::pipelineColorBlendAttachmentState(
            VK_COLOR_COMPONENT_R_BIT | VK_COLOR_COMPONENT_G_BIT |
            VK_COLOR_COMPONENT_B_BIT | VK_COLOR_COMPONENT_A_BIT, VK_FALSE);
    VkPipelineColorBlendStateCreateInfo blendStateCreateInfo = vks::pipelineColorBlendStateCreateInfo(
            1, &blendAttachmentState);

    // 深度测试不一定用得上，先写着，后面传 nullptr
    VkPipelineDepthStencilStateCreateInfo depthStencilStateCreateInfo = vks::pipelineDepthStencilStateCreateInfo(VK_TRUE, VK_TRUE, VK_COMPARE_OP_LESS_OR_EQUAL);
    VkPipelineViewportStateCreateInfo viewportStateCreateInfo = vks::pipelineViewportStateCreateInfo(1,1,0);

    VkPipelineMultisampleStateCreateInfo multisampleState = vks::pipelineMultisampleStateCreateInfo(VK_SAMPLE_COUNT_1_BIT, 0);

    std::vector<VkDynamicState> dynamicStateEnables = {VK_DYNAMIC_STATE_VIEWPORT, VK_DYNAMIC_STATE_SCISSOR};
    VkPipelineDynamicStateCreateInfo dynamicState = vks::pipelineDynamicStateCreateInfo(dynamicStateEnables);

    VkShaderModule vertexShader, fragmentShader;
    buildShader(pVertexShader, VK_SHADER_STAGE_VERTEX_BIT, context.device, &vertexShader);
    buildShader(pFragShader, VK_SHADER_STAGE_FRAGMENT_BIT, context.device, &fragmentShader);

    VkPipelineShaderStageCreateInfo shaderStages[2]{
            {
                    .sType = VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO,
                    .pNext = nullptr,
                    .stage = VK_SHADER_STAGE_VERTEX_BIT,
                    .module = vertexShader,
                    .pSpecializationInfo = nullptr,
                    .flags = 0,
                    .pName = "main",
            },
            {
                    .sType = VK_STRUCTURE_TYPE_PIPELINE_SHADER_STAGE_CREATE_INFO,
                    .pNext = nullptr,
                    .stage = VK_SHADER_STAGE_FRAGMENT_BIT,
                    .module = fragmentShader,
                    .pSpecializationInfo = nullptr,
                    .flags = 0,
                    .pName = "main",
            }};

    VkGraphicsPipelineCreateInfo pipelineCreateInfo = vks::pipelineCreateInfo(pipeline.layout_,renderPass,0);

    pipelineCreateInfo.pInputAssemblyState = &inputAssemblyStateCreateInfo;
    pipelineCreateInfo.pRasterizationState = &rasterizationStateCreateInfo;
    pipelineCreateInfo.pColorBlendState = &blendStateCreateInfo;
    pipelineCreateInfo.pMultisampleState = &multisampleState;
    pipelineCreateInfo.pViewportState = &viewportStateCreateInfo;
    // 不用深度测试，写 nullptr
    pipelineCreateInfo.pDepthStencilState = nullptr;
    pipelineCreateInfo.pDynamicState = &dynamicState;
    pipelineCreateInfo.stageCount = 2;
    pipelineCreateInfo.pStages = shaderStages;
    pipelineCreateInfo.pVertexInputState = &inputStateCreateInfo;

    CALL_VK(vkCreateGraphicsPipelines(context.device, pipeline.cache_, 1, &pipelineCreateInfo,
                                      nullptr, &pipeline.pipeline_));

    vkDestroyShaderModule(context.device,vertexShader, nullptr);
    vkDestroyShaderModule(context.device,fragmentShader, nullptr);
    return VK_SUCCESS;
}

int RGBFilter::buildRenderPass(VkCommandBuffer commandBuffer, VkRenderPass renderPass,
                               VkFramebuffer framebuffer) {
    VkClearValue clearVals{
            .color.float32[0] = 0.0f,
            .color.float32[1] = 0.0f,
            .color.float32[2] = 0.0f,
            .color.float32[3] = 1.0f,
    };

    float pushConstants[3] = {};
    pushConstants[0] = red;
    pushConstants[1] = green;
    pushConstants[2] = blue;

    VkRenderPassBeginInfo offRenderInfo = {};

    offRenderInfo.sType = VK_STRUCTURE_TYPE_RENDER_PASS_BEGIN_INFO;
    offRenderInfo.pNext = nullptr;
    offRenderInfo.renderPass = renderPass;
    offRenderInfo.framebuffer = framebuffer;
    offRenderInfo.renderArea = {
            .extent.width = static_cast<uint32_t>(width),
            .extent.height = static_cast<uint32_t>(height)
    };

    offRenderInfo.clearValueCount = 1;
    offRenderInfo.pClearValues = &clearVals;

    vkCmdBeginRenderPass(commandBuffer, &offRenderInfo, VK_SUBPASS_CONTENTS_INLINE);

    vkCmdPushConstants(commandBuffer,pipeline.layout_,VK_SHADER_STAGE_FRAGMENT_BIT,0, sizeof(pushConstants),pushConstants);

    VkViewport viewport = vks::viewport((float)width,(float)height,0.0f,1.0f);
    vkCmdSetViewport(commandBuffer,0,1,&viewport);

    VkRect2D scissor = vks::rect2D(width,height,0,0);
    vkCmdSetScissor(commandBuffer,0,1,&scissor);

    vkCmdBindPipeline(commandBuffer,
                      VK_PIPELINE_BIND_POINT_GRAPHICS, pipeline.pipeline_);

    vkCmdBindDescriptorSets(commandBuffer, VK_PIPELINE_BIND_POINT_GRAPHICS,
                            pipeline.layout_, 0, 1,
                            &pipeline.descSet_, 0, nullptr);

    VkDeviceSize offset = 0;
    vkCmdBindVertexBuffers(commandBuffer, 0, 1, &vertexBuffer, &offset);

    vkCmdBindIndexBuffer(commandBuffer, indexBuffer, 0, VK_INDEX_TYPE_UINT16);

    vkCmdDrawIndexed(commandBuffer, indexCount, 1, 0, 0, 0);

//    vkCmdDraw(commandBuffer, 3, 1, 0, 0);

    vkCmdEndRenderPass(commandBuffer);

    return VK_SUCCESS;
}

void RGBFilter::setProcess(uint32_t process) {

    red = FilterUtil::getProcess(process,0.0,1.0f);

}

