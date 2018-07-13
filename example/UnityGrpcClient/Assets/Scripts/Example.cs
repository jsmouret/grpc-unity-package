using System;
using UnityEngine;
using UnityEngine.UI;
using Grpc.Core;
using Helloworld;

public class Example : MonoBehaviour {

    public Text Response;

    public void Send()
    {
        try
        {
            var channel = new Channel("127.0.0.1:50051", ChannelCredentials.Insecure);

            var client = new Greeter.GreeterClient(channel);

            var reply = client.SayHello(new HelloRequest { Name = "Unity" });

            Response.text = reply.Message;

            channel.ShutdownAsync().Wait();
        }
        catch (Exception e)
        {
            Response.text = "exception: " + e.Message;
        }
    }
}
