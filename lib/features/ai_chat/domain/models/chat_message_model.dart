import 'package:flutter/material.dart';

enum MessageType {
  user,
  bot,
  predefined,
}

class ChatMessage {
  final String message;
  final MessageType type;
  final DateTime timestamp;
  final bool isLoading;
  final String? clientId;

  ChatMessage({
    required this.message,
    required this.type,
    DateTime? timestamp,
    this.isLoading = false,
    this.clientId,
  }) : timestamp = timestamp ?? DateTime.now();

  ChatMessage copyWith({
    String? message,
    MessageType? type,
    DateTime? timestamp,
    bool? isLoading,
    String? clientId,
  }) {
    return ChatMessage(
      message: message ?? this.message,
      type: type ?? this.type,
      timestamp: timestamp ?? this.timestamp,
      isLoading: isLoading ?? this.isLoading,
      clientId: clientId ?? this.clientId,
    );
  }
}

class PredefinedQuestion {
  final String id;
  final String question;
  final String prompt;
  final IconData icon;
  final bool isClientSpecific;

  const PredefinedQuestion({
    required this.id,
    required this.question,
    required this.prompt,
    required this.icon,
    this.isClientSpecific = false,
  });
}

// Lista de preguntas predefinidas generales
final List<PredefinedQuestion> predefinedQuestions = [
  PredefinedQuestion(
    id: 'sales_summary',
    question: 'ملخص المبيعات',
    prompt:
        'قم بإعداد تقرير موجز عن المبيعات الأخيرة مع التركيز على أعلى المنتجات مبيعًا',
    icon: Icons.bar_chart,
  ),
  PredefinedQuestion(
    id: 'client_recommendations',
    question: 'توصيات للعملاء',
    prompt: 'اقترح استراتيجيات للتواصل مع العملاء غير النشطين وإعادة إشراكهم',
    icon: Icons.people,
  ),
  PredefinedQuestion(
    id: 'task_prioritization',
    question: 'ترتيب أولويات المهام',
    prompt: 'ساعدني في ترتيب أولويات المهام وتحسين إدارة الوقت لفريق المبيعات',
    icon: Icons.task_alt,
  ),
  PredefinedQuestion(
    id: 'market_analysis',
    question: 'تحليل السوق',
    prompt: 'قدم تحليلًا للاتجاهات الحالية في السوق وكيف يمكننا التكيف معها',
    icon: Icons.trending_up,
  ),
  PredefinedQuestion(
    id: 'customer_support',
    question: 'تحسين دعم العملاء',
    prompt: 'اقترح طرقًا لتحسين جودة خدمة العملاء وسرعة الاستجابة',
    icon: Icons.support_agent,
  ),
];

// Lista de preguntas específicas para el perfil de cliente
final List<PredefinedQuestion> clientProfileQuestions = [
  
  PredefinedQuestion(
    id: 'client_close_analysis',
    question: 'تحليل اغلاق الصفقة',
    prompt: 'قم بتحليل نمط المدفوعات والفواتير لهذا العميل وقدم توصيات للتحسين',
    icon: Icons.payments_outlined,
    isClientSpecific: true,
  ),  
  PredefinedQuestion(
    id: 'client_payment_analysis',
    question: 'تحليل مدفوعات العميل',
    prompt: 'قم بتحليل نمط المدفوعات والفواتير لهذا العميل وقدم توصيات للتحسين',
    icon: Icons.payment,
    isClientSpecific: true,
  ),
  PredefinedQuestion(
    id: 'client_engagement',
    question: 'زيادة مشاركة العميل',
    prompt: 'اقترح طرقًا لزيادة مشاركة هذا العميل بناءً على تاريخ تعاملاته',
    icon: Icons.emoji_people,
    isClientSpecific: true,
  ),
  PredefinedQuestion(
    id: 'client_support_status',
    question: 'حالة الدعم الفني',
    prompt: 'قدم ملخصًا لمشاكل الدعم الفني الحالية والسابقة للعميل والاقتراحات',
    icon: Icons.support_agent,
    isClientSpecific: true,
  ),
  PredefinedQuestion(
    id: 'client_opportunities',
    question: 'فرص البيع المتقاطع',
    prompt:
        'حدد فرص البيع المتقاطع والبيع المتزايد لهذا العميل بناءً على المشتريات السابقة',
    icon: Icons.add_shopping_cart,
    isClientSpecific: true,
  ),
  PredefinedQuestion(
    id: 'client_risk_assessment',
    question: 'تقييم المخاطر',
    prompt: 'قم بتقييم مخاطر خسارة هذا العميل وقدم استراتيجيات للاحتفاظ به',
    icon: Icons.warning,
    isClientSpecific: true,
  ),
];
