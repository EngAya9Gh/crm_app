// To parse this JSON data, do
//
//     final notificationTypes = notificationTypesFromJson(jsonString);

import 'dart:convert';

NotificationTypes notificationTypesFromJson(String str) => NotificationTypes.fromJson(json.decode(str));

String notificationTypesToJson(NotificationTypes data) => json.encode(data.toJson());

class NotificationTypes {
    final String? commentMention;
    final String? activityBefore;
    final String? reInstall;
    final String? activity;
    final String? addTicket;
    final String? scheduleClient;
    final String? closeTicket;
    final String? closeSchedule;
    final String? installCanceled;
    final String? receiveClient;
    final String? agentVisit;
    final String? clientVisit;
    final String? invoiceDeleted;
    final String? addPayment;
    final String? notReady;
    final String? editInvoice;
    final String? participateAdd;
    final String? transferRefuse;
    final String? invoiceBack;
    final String? transferAccept;
    final String? deviceAdd;
    final String? invoiceUpdated;
    final String? transfer;
    final String? saleExceeded;
    final String? checkClient;
    final String? addComment;
    final String? exclude;
    final String? approveDone;
    final String? approveRequest;
    final String? install;
    final String? task;
    final String? approveInvoiceBack;
    final String? marketingClient;

    NotificationTypes({
        this.commentMention,
        this.activityBefore,
        this.reInstall,
        this.activity,
        this.addTicket,
        this.scheduleClient,
        this.closeTicket,
        this.closeSchedule,
        this.installCanceled,
        this.receiveClient,
        this.agentVisit,
        this.clientVisit,
        this.invoiceDeleted,
        this.addPayment,
        this.notReady,
        this.editInvoice,
        this.participateAdd,
        this.transferRefuse,
        this.invoiceBack,
        this.transferAccept,
        this.deviceAdd,
        this.invoiceUpdated,
        this.transfer,
        this.saleExceeded,
        this.checkClient,
        this.addComment,
        this.exclude,
        this.approveDone,
        this.approveRequest,
        this.install,
        this.task,
        this.approveInvoiceBack,
        this.marketingClient,
    });

    NotificationTypes copyWith({
        String? commentMention,
        String? activityBefore,
        String? reInstall,
        String? activity,
        String? addTicket,
        String? scheduleClient,
        String? closeTicket,
        String? closeSchedule,
        String? installCanceled,
        String? receiveClient,
        String? agentVisit,
        String? clientVisit,
        String? invoiceDeleted,
        String? addPayment,
        String? notReady,
        String? editInvoice,
        String? participateAdd,
        String? transferRefuse,
        String? invoiceBack,
        String? transferAccept,
        String? deviceAdd,
        String? invoiceUpdated,
        String? transfer,
        String? saleExceeded,
        String? checkClient,
        String? addComment,
        String? exclude,
        String? approveDone,
        String? approveRequest,
        String? install,
        String? task,
        String? approveInvoiceBack,
        String? marketingClient,
    }) => 
        NotificationTypes(
            commentMention: commentMention ?? this.commentMention,
            activityBefore: activityBefore ?? this.activityBefore,
            reInstall: reInstall ?? this.reInstall,
            activity: activity ?? this.activity,
            addTicket: addTicket ?? this.addTicket,
            scheduleClient: scheduleClient ?? this.scheduleClient,
            closeTicket: closeTicket ?? this.closeTicket,
            closeSchedule: closeSchedule ?? this.closeSchedule,
            installCanceled: installCanceled ?? this.installCanceled,
            receiveClient: receiveClient ?? this.receiveClient,
            agentVisit: agentVisit ?? this.agentVisit,
            clientVisit: clientVisit ?? this.clientVisit,
            invoiceDeleted: invoiceDeleted ?? this.invoiceDeleted,
            addPayment: addPayment ?? this.addPayment,
            notReady: notReady ?? this.notReady,
            editInvoice: editInvoice ?? this.editInvoice,
            participateAdd: participateAdd ?? this.participateAdd,
            transferRefuse: transferRefuse ?? this.transferRefuse,
            invoiceBack: invoiceBack ?? this.invoiceBack,
            transferAccept: transferAccept ?? this.transferAccept,
            deviceAdd: deviceAdd ?? this.deviceAdd,
            invoiceUpdated: invoiceUpdated ?? this.invoiceUpdated,
            transfer: transfer ?? this.transfer,
            saleExceeded: saleExceeded ?? this.saleExceeded,
            checkClient: checkClient ?? this.checkClient,
            addComment: addComment ?? this.addComment,
            exclude: exclude ?? this.exclude,
            approveDone: approveDone ?? this.approveDone,
            approveRequest: approveRequest ?? this.approveRequest,
            install: install ?? this.install,
            task: task ?? this.task,
            approveInvoiceBack: approveInvoiceBack ?? this.approveInvoiceBack,
            marketingClient: marketingClient ?? this.marketingClient,
        );

    factory NotificationTypes.fromJson(Map<String, dynamic> json) => NotificationTypes(
        commentMention: json["commentMention"],
        activityBefore: json["ActivityBefore"],
        reInstall: json["reInstall"],
        activity: json["activity"],
        addTicket: json["addTicket"],
        scheduleClient: json["scheduleClient"],
        closeTicket: json["closeTicket"],
        closeSchedule: json["closeSchedule"],
        installCanceled: json["installCanceled"],
        receiveClient: json["receiveClient"],
        agentVisit: json["agentVisit"],
        clientVisit: json["clientVisit"],
        invoiceDeleted: json["InvoiceDeleted"],
        addPayment: json["AddPayment"],
        notReady: json["NotReady"],
        editInvoice: json["EditInvoice"],
        participateAdd: json["participateAdd"],
        transferRefuse: json["TransferRefuse"],
        invoiceBack: json["InvoiceBack"],
        transferAccept: json["TransferAccept"],
        deviceAdd: json["deviceAdd"],
        invoiceUpdated: json["InvoiceUpdated"],
        transfer: json["Transfer"],
        saleExceeded: json["saleExceeded"],
        checkClient: json["checkClient"],
        addComment: json["AddComment"],
        exclude: json["exclude"],
        approveDone: json["ApproveDone"],
        approveRequest: json["ApproveRequest"],
        install: json["Install"],
        task: json["task"],
        approveInvoiceBack: json["ApproveInvoiceBack"],
        marketingClient: json["Marketing Client"],
    );

    Map<String, dynamic> toJson() => {
        "commentMention": commentMention,
        "ActivityBefore": activityBefore,
        "reInstall": reInstall,
        "activity": activity,
        "addTicket": addTicket,
        "scheduleClient": scheduleClient,
        "closeTicket": closeTicket,
        "closeSchedule": closeSchedule,
        "installCanceled": installCanceled,
        "receiveClient": receiveClient,
        "agentVisit": agentVisit,
        "clientVisit": clientVisit,
        "InvoiceDeleted": invoiceDeleted,
        "AddPayment": addPayment,
        "NotReady": notReady,
        "EditInvoice": editInvoice,
        "participateAdd": participateAdd,
        "TransferRefuse": transferRefuse,
        "InvoiceBack": invoiceBack,
        "TransferAccept": transferAccept,
        "deviceAdd": deviceAdd,
        "InvoiceUpdated": invoiceUpdated,
        "Transfer": transfer,
        "saleExceeded": saleExceeded,
        "checkClient": checkClient,
        "AddComment": addComment,
        "exclude": exclude,
        "ApproveDone": approveDone,
        "ApproveRequest": approveRequest,
        "Install": install,
        "task": task,
        "ApproveInvoiceBack": approveInvoiceBack,
        "Marketing Client": marketingClient,
    };
}
