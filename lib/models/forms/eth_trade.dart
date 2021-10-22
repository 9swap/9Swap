import 'package:formz/formz.dart';
import 'package:yakuswap/models/eth_trade.dart';
import 'package:yakuswap/models/forms/trade_currency.dart';
import 'package:yakuswap/models/inputs/address_prefix.dart';
import 'package:yakuswap/models/inputs/eth_adress.dart';
import 'package:yakuswap/models/inputs/hash.dart';
import 'package:yakuswap/models/inputs/id.dart';
import 'package:yakuswap/models/inputs/max_block_height.dart';
import 'package:yakuswap/models/inputs/min_confirmation_height.dart';
import 'package:yakuswap/models/inputs/secret.dart';
import 'package:yakuswap/models/inputs/step.dart';
import 'package:yakuswap/models/inputs/transaction_amount.dart';

class EthTradeForm with FormzMixin {
  final IdInput id;
  final TradeCurrencyForm tradeCurrency;
  final EthAddressInput ethFromAddress;
  final EthAddressInput ethToAddress;
  final TransactionAmountInput ethTotalGwei;
  final HashInput secretHash;
  final SecretInput secret;
  final StepInput step;
  final bool isBuyer;
  final String network;
  final String token;

  const EthTradeForm({
    this.id = const IdInput.pure(),
    this.tradeCurrency = const TradeCurrencyForm(),
    this.ethFromAddress = const EthAddressInput.pure(),
    this.ethToAddress = const EthAddressInput.pure(),
    this.ethTotalGwei = const TransactionAmountInput.pure(),
    this.secretHash = const HashInput.pure(),
    this.secret = const SecretInput.pure(),
    this.step = const StepInput.pure(),
    this.isBuyer = true,
    this.network = "Rinkeby Testnet",
    this.token = "WETH",
  });

  EthTradeForm autoGenerateFields() {
    final String secret = SecretInput.generateSecret();
    final String id = IdInput.generateId();

    return copyWith(
      id:  IdInput.dirty(value: id),
      tradeCurrency: TradeCurrencyForm(
        id: IdInput.dirty(value: "$id-1"),
        addressPrefix: const AddressPrefixInput.dirty(value: "nch"),
        maxBlockHeight: const MaxBlockHeightInput.dirty(value: "192"),
        minConfirmationHeight: const MinConfirmationHeightInput.dirty(value: "32"),
      ),
      secretHash: HashInput.forSecret(secret: secret),
      secret: SecretInput.dirty(value: secret),
      step: const StepInput.dirty(value: "0"),
      isBuyer: true,
    );
  }

  EthTradeForm.fromTrade({required EthTrade trade}) :
    id = IdInput.dirty(value: trade.id),
    tradeCurrency = TradeCurrencyForm.fromTradeCurrency(tradeCurrency: trade.tradeCurrency),
    ethFromAddress = EthAddressInput.dirty(value: trade.ethFromAddress),
    ethToAddress = EthAddressInput.dirty(value: trade.ethToAddress),
    ethTotalGwei = TransactionAmountInput.dirty(value: trade.totalGwei.toString()),
    secretHash = HashInput.dirty(value: trade.secretHash),
    secret = SecretInput.dirty(value: trade.secret ?? ""),
    step = StepInput.dirty(value: "${trade.step}"),
    isBuyer = trade.isBuyer,
    network = trade.network,
    token = trade.token;

  EthTradeForm copyWith({
    IdInput? id,
    TradeCurrencyForm? tradeCurrency,
    EthAddressInput? ethFromAddress,
    EthAddressInput? ethToAddress,
    TransactionAmountInput? ethTotalGwei,
    HashInput? secretHash,
    SecretInput? secret,
    StepInput? step,
    bool? isBuyer,
    String? network,
    String? token,
  }) => EthTradeForm(
    id: id ?? this.id,
    tradeCurrency: tradeCurrency ?? this.tradeCurrency,
    ethFromAddress: ethFromAddress ?? this.ethFromAddress,
    ethToAddress: ethToAddress ?? this.ethToAddress,
    ethTotalGwei: ethTotalGwei ?? this.ethTotalGwei,
    secretHash: secretHash ?? this.secretHash,
    secret: secret ?? this.secret,
    step: step ?? this.step,
    isBuyer: isBuyer ?? this.isBuyer,
    network: network ?? this.network,
    token: token ?? this.token,
  );

  EthTrade? toTrade() => status == FormzStatus.valid ? EthTrade(
    id: id.value,
    tradeCurrency: tradeCurrency.toTradeCurrency()!,
    ethFromAddress: ethFromAddress.value,
    ethToAddress: ethToAddress.value,
    totalGwei: int.parse(ethTotalGwei.value),
    secretHash: secretHash.value,
    secret: secret.value.isEmpty ? null : secret.value,
    step: int.parse(step.value),
    isBuyer: isBuyer,
    network: network,
    token: token,
  ) : null;

  @override
  List<FormzInput> get inputs => [id, ...tradeCurrency.inputs, ethFromAddress, ethToAddress, ethTotalGwei, secretHash, secret, step];
}
