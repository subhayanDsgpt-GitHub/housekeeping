# Author:           Subhayan Dasgupta
# Date Created:     24/01/2024
# Date Modified:    25/01/2024

# Description:
# Deploy AWS managed REST API Gateway using Terraform.

# Usage:
#
# Manages an API Gateway REST API. The REST API can be configured via importing an OpenAPI specification in
# the body argument (with other arguments serving as overrides) or via other Terraform resources to manage
# the resources (aws_api_gateway_resource resource), methods (aws_api_gateway_method resource),
# integration(aws_api_gateway_integration resource), etc. of the REST API. Once the REST API is configured,
# the aws_api_gateway_deployment resource can be used along with the aws_api_gateway_stage resource to publish the # REST API.
#
# Acknowledgement: https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/api_gateway_rest_api

# Deploy an AWS managed REST API Gateway.
resource "aws_api_gateway_rest_api" "test_aws_api_gateway_rest_api" {
  body = jsonencode({
    openapi = "3.0.1"
    info = {
      title   = "${var.prefix}RESTAPIGateway"
      version = "1.0"
    }

    # Set up a context path for REST.
    paths = {
      "/path1" = {
        get = {
          x-amazon-apigateway-integration = {
            httpMethod           = "GET"
            payloadFormatVersion = "1.0"
            type                 = "HTTP_PROXY"
            uri                  = "https://ip-ranges.amazonaws.com/ip-ranges.json"
          }
        }
      }
    }
  })

  name = "${var.prefix}RESTAPIGateway"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}

# Deploy an AWS managed REST API Gateway Deployment.
resource "aws_api_gateway_deployment" "test_aws_api_gateway_deployment" {
  rest_api_id = aws_api_gateway_rest_api.test_aws_api_gateway_rest_api.id

  triggers = {
    redeployment = sha1(jsonencode(aws_api_gateway_rest_api.test_aws_api_gateway_rest_api.body))
  }

  lifecycle {
    create_before_destroy = true
  }
}

# Deploy an AWS managed REST API Gateway Stage.
resource "aws_api_gateway_stage" "test_aws_api_gateway_stage" {
  deployment_id = aws_api_gateway_deployment.test_aws_api_gateway_deployment.id
  rest_api_id   = aws_api_gateway_rest_api.test_aws_api_gateway_rest_api.id
  stage_name    = "${var.prefix}RESTAPIGatewayStage"
}