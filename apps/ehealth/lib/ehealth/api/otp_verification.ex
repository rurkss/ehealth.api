defmodule EHealth.API.OTPVerification do
  @moduledoc """
  OTP Verification API client
  """

  use HTTPoison.Base
  use Confex, otp_app: :ehealth
  use EHealth.API.HeadersProcessor
  use EHealth.API.Helpers.MicroserviceBase

  def initialize(number, headers \\ []) do
    post!("/verifications", Jason.encode!(%{phone_number: number}), headers) end

  def search(number, headers \\ []) do
    get!("/verifications/#{number}", headers)
  end

  def complete(number, params, headers \\ []) do
    patch!("/verifications/#{number}/actions/complete", Jason.encode!(params), headers) end

  def send_sms(phone_number, body, type, headers \\ []) do
    post!("/sms/send", Jason.encode!(%{phone_number: phone_number, body: body, type: type}), headers) end
end
